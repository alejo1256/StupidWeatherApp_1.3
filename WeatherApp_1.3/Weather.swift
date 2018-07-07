//
//  Weather.swift
//  WeatherApp_1.3
//
//  Created by Alejandro Gonzalez on 6/11/18.
//  Copyright © 2018 Alejandro Gonzalez. All rights reserved.
//

import Foundation
import CoreData

class Weather: NSManagedObject, Codable  {
    
    @NSManaged var time: Int32
    @NSManaged var summary: String
    @NSManaged var temperature: Double
    @NSManaged var humidity: Double
    
    enum Codingkeys: String, CodingKey {
        case currently
    }
    
    enum CurrentlyKeys: String, CodingKey {
        case time
        case summary
        case temperature
        case humidity
    }
    
    //MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Weather", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: Codingkeys.self)
        let currently = try values.nestedContainer(keyedBy: CurrentlyKeys.self, forKey: .currently)
        
        summary = try currently.decode(String.self, forKey: .summary)
        time = try currently.decode(Int32.self, forKey: .time)
        temperature = try currently.decode(Double.self, forKey: .temperature)
        humidity = try currently.decode(Double.self, forKey: .humidity)
        
    }
    
    // MARK:  Encodable
    
}

public extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
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
















