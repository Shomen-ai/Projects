//
//  ContentView.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import SDWebImageSwiftUI
import SwiftUI
import CoreLocation
import MapKit
import Combine

struct ContentView: View {
    
    @StateObject private var forecatListVM = ForecastListViewModel()
    @StateObject private var hourlyListVM = HourlyListViewModel()
    @ObservedObject var locationManager = LocationManager()
    @State var refresh = Refresh(started: false, released: false)
    
    var userLatitude: Double {
        return locationManager.lastLocation?.coordinate.latitude ?? 0
    }
    
    var userLongitude: Double {
        return locationManager.lastLocation?.coordinate.longitude ?? 0
    }
    var body: some View {
        NavigationView {
            ScrollView {
                GeometryReader { reader -> AnyView in
                    DispatchQueue.main.async {
                        if refresh.startOffset == 0 {
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                        refresh.offset = reader.frame(in: .global).minY
                        if refresh.offset - refresh.startOffset > 75 && !refresh.started{
                            refresh.started = true
                        }
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                            withAnimation(Animation.linear){refresh.released = true}
                            UpdateData()
                        }
                    }
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                VStack {
                    if refresh.started && refresh.released {
                        ProgressView()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(forecatListVM.forecasts, id: \.day) { day in
                                GeometryReader { geo in
                                    VStack{
                                        Text(day.day)
                                            .fontWeight(.bold)
                                        
                                        HStack(alignment: .center){
                                            WebImage(url: day.weatherIconURL)
                                                .resizable()
                                                .placeholder{
                                                    Image(systemName: "hourglass")
                                                }
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                                .cornerRadius(3.0)
                                        }
                                        VStack{
                                            Text(day.overview)
                                                .padding(.bottom, 5)
                                            VStack(alignment: .leading) {
                                                Text(day.temp)
                                                Text(day.pop)
                                                Text(day.clouds)
                                                Text(day.humidity)
                                            }
                                        }
                                    }.frame(width: 190, height: 290)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.blue, lineWidth: 4)
                                    )
                                    .padding(.leading, 95)
                                    .padding(.trailing, 100)
                                    .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - 95) / 10), axis: (x: 0, y: -2, z: 0))
                                }.frame(width: 190, height: 290)
                                .padding(.trailing, 100)
                            }
                            HStack() {}.frame(width: 80, height: 280)
                        }.frame(height: 350)
                    }.frame(height: 320)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    
                    
                    ScrollView(showsIndicators: false){
                        VStack {
                            ForEach(hourlyListVM.hours, id: \.hour) { hour in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(hour.hour)
                                            .fontWeight(.bold)
                                    }.padding(.leading, 10)
                                    
                                    VStack(alignment: .leading){
                                        WebImage(url: hour.weatherIconURL)
                                            .resizable()
                                            .placeholder{
                                                Image(systemName: "hourglass")
                                            }
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(3.0)
                                    }
                                    VStack {
                                        Text(hour.overview)
                                            .multilineTextAlignment(.center)
                                        HStack(alignment: .center) {
                                            Text(hour.temp)
                                            Text(hour.pop)
                                        }
                                        HStack(alignment: .center) {
                                            Text(hour.clouds)
                                            Text(hour.humidity)
                                        }
                                    }.frame(width: 170)
                                }.frame(width: 350, height: 90)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 4))
                            }
                        }.frame(width: 360)
                        .padding(.top, 5)
                    }.frame(width: 370, height: 302)
                    Divider()
                }
            }
            .onAppear{
                hourlyListVM.getWeatherHourly(lon: userLongitude, lat: userLatitude)
                forecatListVM.getWeatherForecast(lon: userLongitude, lat: userLatitude)
                print("1")
            }
            .navigationBarTitle("Master view123")
            .padding(.top, -10)
        }
    }
    func UpdateData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear){
                hourlyListVM.getWeatherHourly(lon: userLongitude, lat: userLatitude)
                forecatListVM.getWeatherForecast(lon: userLongitude, lat: userLatitude)
                refresh.released = false
                refresh.started = false
            }
            print("2")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
}




















class LocationManager: NSObject, ObservableObject {
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var lastLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
        
    }
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    private let locationManager = CLLocationManager()
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location
        print(#function, location)
    }
    
}
