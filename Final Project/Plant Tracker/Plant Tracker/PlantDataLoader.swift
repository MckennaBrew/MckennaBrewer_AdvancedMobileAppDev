//
//  PlantDataLoader.swift
//  Plant Tracker
//
//  Created by Mckenna Brewer on 2/22/21.
//

import Foundation

class PlantDataLoader{
    
    var plantData = [PlantData]()
    
    func loadPlants(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                
                //decodes the property list
                plantData = try plistdecoder.decode([PlantData].self, from: data)
            }
            catch {
                // handle error
                print(error)
            }
        }
    }
    
    
    func getPlants() -> [PlantData]{
        var plants = [PlantData]()
        
        for item in plantData{
            plants.append(item)
        }
        
        //NSLog("Data Loaded")
        return plants
    }
    
    
    
    
    
 // Getting Data Methods //////////////////////
    
    /*
    // get plant names
    func getPlantName() -> [String]{
        var plants = [String]()
        
        for item in plantData{
            plants.append(item.name)
        }
        
        return plants
    }
    
    // get scientific name
    func scienceName() -> [String] {
        var scienceNames = [String]()
        
        for item in plantData{
            scienceNames.append(item.scientificName)
        }
        
        return scienceNames
    }
    
    // get watering info
    func getWater() -> [String]{
        var water = [String]()
        
        for item in plantData{
            water.append(item.water)
        }
        
        return water
    }
    
    // get sun info
    func getSun() -> [String]{
        var sun = [String]()
        
        for item in plantData{
            sun.append(item.sun)
        }
        
        return sun
    }
    
    // get care level
    func getCareLvl() -> [String]{
        var careLvl = [String]()
        
        for item in plantData{
            careLvl.append(item.careLevel)
        }
        
        return careLvl
    } */
    

    
    
}
