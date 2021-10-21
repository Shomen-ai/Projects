//
//  HourlyListViewModel.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import CoreLocation
import Foundation
import SwiftUI

class HourlyListViewModel: NSObject, ObservableObject {
    
    @Published var hours: [HourlyViewModel] = []
    
    func getWeatherHourly(lon: CLLocationDegrees, lat: CLLocationDegrees) {
        let apiService = APIService.shared
        
        apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&units=metric&lang=ru&exclude=current,minutely,daily,alerts&appid=5d22f92acc8be4c59049ac06e0545eda",
                           dateDecodingStrategy: .secondsSince1970) { (result: Result<Today, APIService.APIError>) in
            switch result {
            case .success(let today) :
                DispatchQueue.main.async {
                    self.hours = today.hourly.map {HourlyViewModel(today: $0)}
                }
            case .failure (let apiError):
                switch apiError {
                case .error (let errorString):
                    print(errorString)
                }
            }
        }
        
    }
}


//extension HourlyListViewModel: CLLocationManagerDelegate {
//    private func locationManager(
//        _ manager: CLLocationManager,
//        didUpdateLocations locations: [CLLocation]
//    ) -> [Double] {
//        if let location = locations.first {
//            var output: [Double]
//            let latitude = location.coordinate.latitude
//            let longitude = location.coordinate.longitude
//            output.append(latitude)
//            output.append(longitude)
//            return output
//        }
//    }
//}
