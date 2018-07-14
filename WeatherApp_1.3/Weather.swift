//
//  Weather.swift
//  WeatherApp_1.3
//
//  Created by Alejandro Gonzalez on 6/11/18.
//  Copyright © 2018 Alejandro Gonzalez. All rights reserved.
//

import Foundation




struct Weather: Codable {
    var currently: Currently
    var daily: Daily
    
    struct Currently: Codable {
        var time: Int
        var summary: String
        var temperature: Double
        var humidity: Double
        
        enum CurrentlyKeys: String, CodingKey {
            case time
            case summary
            case temperature
            case humidity
        }
    }
    
    struct Daily: Codable {
        var data: [Datum]
    }
    
    struct Datum: Codable {
        var temperatureMin, temperatureMax: Double
        
        enum DailyKeys: String, CodingKey {
            case temperatureMin
            case temperatureMax
        }
    }
}












//struct Weather: Codable {
//    var time: Int32
//    var summary: String
//    var temperature: Double
//    var humidity: Double
//
//    var maxTemp: Double
//    var minTemp: Double
//
//    enum Codingkeys: String, CodingKey {
//        case currently
//        case daily
//    }
//
//    enum DailyKeys: String, CodingKey {
//        case maxTemp = "temperatureHigh"
//        case minTemp = "temperatureLow"
//    }
//
//    enum CurrentlyKeys: String, CodingKey {
//        case time
//        case summary
//        case temperature
//        case humidity
//    }
//
//    init(from decodoer: Decoder) throws {
//        let values = try decodoer.container(keyedBy: Codingkeys.self)
//        let currently = try values.nestedContainer(keyedBy: CurrentlyKeys.self, forKey: .currently)
//
//        let dailyData = try values.nestedContainer(keyedBy: DailyKeys.self, forKey: .daily)
//
//        maxTemp = try dailyData.decode(Double.self, forKey: .maxTemp)
//        minTemp = try dailyData.decode(Double.self, forKey: .minTemp)
//
//
//
//        time = try currently.decode(Int32.self, forKey: .time)
//        summary = try currently.decode(String.self, forKey: .summary)
//        temperature = try currently.decode(Double.self, forKey: .temperature)
//        humidity = try currently.decode(Double.self, forKey: .humidity)
//    }
//}
//






















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
















