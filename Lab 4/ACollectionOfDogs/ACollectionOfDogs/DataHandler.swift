//
//  DataHandler.swift
//  ACollectionOfDogs
//
//  Created by Mckenna Brewer on 2/28/21.
//

import Foundation

class DataHandler{
    var allData = [Dogs]()
    
    func loadData(fileName: String){
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([Dogs].self, from: data)
            }
            catch {
                // handle error
                print(error)
            }
        }
    }
    
    func getDogs() -> [String]{
        var dogs = [String]()
        
        for dog in allData{
            dogs.append(dog.name)
        }
        
        return dogs
    }
    
    
    func getDescription(index:Int) -> String{
        return allData[index].description
    }
    
    func getArray(index:Int) -> String{
        return allData[index].arrayName
    }
}
