//
//  ForecastListViewModel.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import CoreLocation
import Foundation
import SwiftUI

class ForecastListViewModel: ObservableObject {
    
    @Published var forecasts: [ForecastViewModel] = []
    
    func getWeatherForecast(lon: CLLocationDegrees, lat: CLLocationDegrees) {
        let apiService = APIService.shared
        
        apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&units=metric&lang=ru&exclude=current,minutely,hourly,alerts&appid=5d22f92acc8be4c59049ac06e0545eda",
                           dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast, APIService.APIError>) in
            switch result {
            case .success(let forecast) :
                DispatchQueue.main.async {
                    self.forecasts = forecast.daily.map {ForecastViewModel(forecast: $0)}
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

