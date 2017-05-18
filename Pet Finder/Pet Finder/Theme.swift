//
//  Theme.swift
//  Pet Finder
//
//  Created by Ryan Lee on 5/17/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit

enum Theme: Int {
  case `default`, dark, graphical
  
  private enum Keys {
      static let selectedTheme = "SelectedTheme"
  }
  
  static var current: Theme {
    let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
    return Theme(rawValue: storedTheme) ?? .default
  }
  
  var mainColor: UIColor {
    switch self {
    case .default:
      return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    case .dark:
      return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    case .graphical:
      return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
    }
  }
  
}
