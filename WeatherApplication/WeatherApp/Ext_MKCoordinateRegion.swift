//
//  Ext_MKCoordinateRegion.swift
//  WeatherApp
//
//  Created by Дмитрий Шайманов on 04.10.2021.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 55.751244, longitude: 37.618423), latitudinalMeters: 100, longitudinalMeters: 100)
    }
}
