//
//  LocationLoader.swift
//  TravelGuide
//
//  Created by Mckenna Brewer on 2/1/21.
//

import Foundation

class LocationLoader{
    var allData = [TravelLocations]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist") {
            //initializes a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                // decodes the property list
                allData = try plistdecoder.decode([TravelLocations].self, from: data)
            } catch{
                // handle error
                print("Cannot load data")
            
            }
        }
    }
    
    func getCountries()-> [String]{
        var countries = [String]()
        for country in allData{
            countries.append(country.name)
        }
        
        return countries
    }
    
    func getCities(index: Int)-> [String]{
        return allData[index].cities
    }
}
