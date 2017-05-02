//
//  WeatherGetter.swift
//  WeatherAPITest
//
//  Created by Ryan Lee on 5/1/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import Foundation

class WeatherGetter {
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "104f3777745491d609c1d846c117740e"
    
    func getWeather(city: String) {
        let session = URLSession.shared
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
        
        let dataTask = session.dataTask(with: weatherRequestURL) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let weather = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    
                    print("Date and time: \(weather["dt"])")
                    print("City: \(weather["name"])")
                    
                    print("Longitude: \(weather["coord"]!["lon"]!!)")
                    print("Latitude: \(weather["coord"]!["lat"]!!)")
                } catch let jsonError as NSError {
                    print(jsonError.localizedDescription)
                }
            }
        }
        
        dataTask.resume()
    }
}
