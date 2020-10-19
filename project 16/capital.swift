//
//  capital.swift
//  project 16
//
//  Created by Kristoffer Eriksson on 2020-10-16.
//

import UIKit
import MapKit

class capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
}
