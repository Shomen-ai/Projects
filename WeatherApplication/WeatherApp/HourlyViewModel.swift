//
//  HourlyViewModel.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import Foundation

struct HourlyViewModel {
    let today: Today.Hourly
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }
    
//    private static var numberFormatter: NumberFormatter {
//        let numberFormetter = NumberFormatter()
//        numberFormetter.maximumFractionDigits = 0
//        return numberFormetter
//    }
    
    var hour: String {
        return Self.dateFormatter.string(from: today.dt)
    }
    
    var overview: String {
        today.weather[0].description
    }
    
    var temp: String{
        return String(format: "🌡 %.f°C - %.f°C", today.temp, today.temp)
    }
    
    var pop: String{
        return String(format:"🌧 %.f ",today.pop) + "%"
    }
    
    var clouds: String{
        return "☁️ \(today.clouds) %"
    }
    
    var humidity: String {
        return "💧 \(today.humidity) %"
    }
    
    var weatherIconURL: URL{
        let urlString = "https://openweathermap.org/img/wn/\(today.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
}
