//
//  PlantData.swift
//  Plant Tracker
//
//  Created by Mckenna Brewer on 2/22/21.
//

import Foundation

struct PlantData: Codable{
    var name: String
    var scientificName: String
    var water: String
    var sun: String
    var careLevel: String
}
