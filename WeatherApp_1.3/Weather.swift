//
//  Weather.swift
//  WeatherApp_1.3
//
//  Created by Alejandro Gonzalez on 6/11/18.
//  Copyright © 2018 Alejandro Gonzalez. All rights reserved.
//

import Foundation


struct Weather: Codable {
    
    let summary : String
    let time : Int
    let temperature: Double
    let humidity: Double
    let currently = ""
    
    enum CodingKeys:  String, CodingKey {
        case currently
    }
    
    enum CurrentlyKeys: String, CodingKey {
        case summary
        case time
        case temperature
        case humidity
        //case currently
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let currently = try values.nestedContainer(keyedBy: CurrentlyKeys.self, forKey: .currently)
        
        summary = try currently.decode(String.self, forKey: .summary)
        time = try currently.decode(Int.self, forKey: .time)
        temperature = try currently.decode(Double.self, forKey: .temperature)
        humidity = try currently.decode(Double.self, forKey: .humidity)
        
        
        
    }
    
    
    
    
    
}






















//    var name: String = ""
//    var description: String = ""
//    var temperature: Double = 0
//    var humidity: Double = 0
//    var temp_max: Double = 0
//
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case description = "summary"
//
//
//
//    }
//
//    enum CurrentlyKeys: String, CodingKey {
//        case temperature
//        case temp_min
//        case temp_max
//        case humidity
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let current = try decoder.container(keyedBy: CurrentlyKeys.self)
//
//        name = try values.decode(String.self, forKey: .name)
//        description = try values.decode(String.self, forKey: .description)
//
//        temperature = try current.decode(Double.self, forKey: .temperature)
//        humidity = try current.decode(Double.self, forKey: .humidity)
//        temp_max = try current.decode(Double.self, forKey: .temp_max)
//    }
//
//}
//
////struct WeatherDataStore: Codable {
////    var currently: [Weather]
////}
















