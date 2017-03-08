//
//  Capital.swift
//  MapKitPlayground
//
//  Created by Ryan Lee on 3/7/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {

    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
}
