//
//  HourlyListViewModel.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import CoreLocation
import Foundation
import SwiftUI

class HourlyListViewModel: ObservableObject {
    
    @Published var hours: [HourlyViewModel] = []
    @AppStorage("location") var location = ""
    
    init() {
        if location != "" {
            getWeatherHourly()
        }
    }
    
    func getWeatherHourly() {
        let apiService = APIService.shared
        CLGeocoder().geocodeAddressString(location) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude{
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
    }
}
