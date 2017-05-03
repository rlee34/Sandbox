//
//  ViewController.swift
//  WeatherAPITest
//
//  Created by Ryan Lee on 5/1/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherGetterDelegate {

    var weather: WeatherGetter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather = WeatherGetter(delegate: self)
        weather.getWeatherBy(city: "Tampa")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didGetWeather(weather: Weather) {
        
    }
    
    func didNotGetWeather(error: NSError) {
        
    }
}

