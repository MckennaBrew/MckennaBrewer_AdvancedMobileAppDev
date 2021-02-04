//
//  ThirdViewController.swift
//  TravelGuide
//
//  Created by Mckenna Brewer on 2/2/21.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var startPicker: UIDatePicker!
    
    @IBOutlet weak var endPicker: UIDatePicker!
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startPicker.datePickerMode = .date
        endPicker.datePickerMode = .date
        
        startPicker.preferredDatePickerStyle = .automatic
        endPicker.preferredDatePickerStyle = .automatic
        

        // Do any additional setup after loading the view.
    }
    
    
    
    

    @IBAction func getDates(_ sender: Any) {
        let startDate = startPicker.date
        let endDate = endPicker.date
        
        let daysBetween = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day!
        
        
        //var tripDays = startDate - endDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        let dateString1 = dateFormatter.string(from: startPicker.date)
        let dateString2 = dateFormatter.string(from: endPicker.date)
        
        choiceLabel.text = "You want to travel for \(daysBetween) days, \n from \(dateString1) to \(dateString2)."
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
