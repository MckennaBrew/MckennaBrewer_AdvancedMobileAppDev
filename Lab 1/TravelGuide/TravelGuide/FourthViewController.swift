//
//  FourthViewController.swift
//  TravelGuide
//
//  Created by Mckenna Brewer on 2/2/21.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBAction func bookExpedia(_ sender: Any) {
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "expedia://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "expedia://")!, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.open(URL(string: "http://www.expedia.com")!, options: [:], completionHandler: nil)
        }
        
    
        
    }
    
    @IBAction func bookTravelocity(_ sender: Any) {
        
        if(UIApplication.shared.canOpenURL(URL(string: "travelocity://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "travelocity://")!, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.open(URL(string: "http://www.travelocity.com")!, options: [:], completionHandler: nil)
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
