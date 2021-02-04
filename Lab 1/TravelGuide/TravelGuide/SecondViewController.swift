//
//  SecondViewController.swift
//  TravelGuide
//
//  Created by Mckenna Brewer on 1/31/21.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var pickerLabel: UILabel!
    @IBOutlet weak var pickerImage: UIImageView!
    
    var locationData = LocationLoader()
    var countries = [String]()
    var cities = [String]()
    
    let filename = "travellocations"
    let countryComponent = 0
    let cityComponent = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationData.loadData(filename: filename)
        countries = locationData.getCountries()
        cities = locationData.getCities(index: 0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == countryComponent{
            return countries.count
        }
        else{
            return cities.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == countryComponent{
            return countries[row]
        }
        else{
            return cities[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == countryComponent{
            cities = locationData.getCities(index: row)
            locationPicker.reloadComponent(cityComponent)
            locationPicker.selectRow(0, inComponent: cityComponent, animated: true)
        }
        
        let countryRow = pickerView.selectedRow(inComponent: countryComponent) //gets the selected row for the artist
        let cityRow = pickerView.selectedRow(inComponent: cityComponent) //gets the selected row for the album
        
        pickerLabel.text = "You want to travel to the city of \(cities[cityRow]) in \(countries[countryRow])."
        pickerImage.image = UIImage(named: countries[countryRow])
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
