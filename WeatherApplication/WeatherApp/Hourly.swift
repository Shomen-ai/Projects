//
//  Hourly.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 29.09.2021.
//

import Foundation

struct Today: Codable {
    struct Hourly: Codable {
        let dt: Date
        let temp: Double
        let humidity: Int
        let clouds: Int
        struct Weather: Codable {
            let id: Int
            let description: String
            let icon: String
        }
        let weather: [Weather]
        let pop: Double
    }
    let hourly: [Hourly]
}
