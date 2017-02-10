//
//  Person.swift
//  NamesToFaces
//
//  Created by Ryan Lee on 2/9/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
