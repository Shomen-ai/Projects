//
//  ContentView.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    
    @StateObject private var forecatListVM = ForecastListViewModel()
    @StateObject private var hourlyListVM = HourlyListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Введите город", text: $forecatListVM.location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        forecatListVM.getWeatherForecast()
                        hourlyListVM.getWeatherHourly()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title3)
                    }
                }
                Text("Погода на сегодня")
                
                List(hourlyListVM.hours, id: \.hour) { hour in
                    VStack(alignment: .leading){
                        Text(hour.hour)
                            .fontWeight(.bold)
                        HStack(alignment: .center){
                            WebImage(url: hour.weatherIconURL)
                                .resizable()
                                .placeholder{
                                    Image(systemName: "hourglass")
                                }
                                .scaledToFit()
                                .frame(width: 75)
                                .cornerRadius(3.0)
                            
                            VStack(alignment: .leading){
                                Text(hour.overview)
                                Text(hour.temp)
                                HStack {
                                    Text(hour.pop)
                                    Text(hour.clouds)
                                    Text(hour.humidity)
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Text("Погода на неделю")

                List(forecatListVM.forecasts, id: \.day) { day in
                    VStack(alignment: .leading){
                        Text(day.day)
                            .fontWeight(.bold)
                        HStack(alignment: .center){
                            WebImage(url: day.weatherIconURL)
                                .resizable()
                                .placeholder{
                                    Image(systemName: "hourglass")
                                }
                                .scaledToFit()
                                .frame(width: 75)
                                .cornerRadius(3.0)
                            
                            VStack(alignment: .leading){
                                Text(day.overview)
                                Text(day.temp)
                                HStack {
                                    Text(day.pop)
                                    Text(day.clouds)
                                    Text(day.humidity)
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding(.horizontal)
            .navigationTitle("Погода")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
