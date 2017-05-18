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
}
