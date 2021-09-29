//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import Foundation

struct ForecastViewModel {
    let forecast: Forecast.Daily
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEE, d MMMM"
        return dateFormatter
    }
    
//    private static var numberFormatter: NumberFormatter {
//        let numberFormetter = NumberFormatter()
//        numberFormetter.maximumFractionDigits = 0
//        return numberFormetter
//    }
    
    var day: String {
        return Self.dateFormatter.string(from: forecast.dt)
    }
    
    var overview: String {
        forecast.weather[0].description
    }
    
    var temp: String{
        return String(format: "🌡 %.f°C - %.f°C",forecast.temp.min, forecast.temp.max)
    }
    
    var pop: String{
        return String(format:"🌧 %.f ",forecast.pop) + "%"
    }
    
    var clouds: String{
        return "☁️ \(forecast.clouds) %"
    }
    
    var humidity: String {
        return "💧 \(forecast.humidity) %"
    }
    
    var weatherIconURL: URL{
        let urlString = "https://openweathermap.org/img/wn/\(forecast.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
}
