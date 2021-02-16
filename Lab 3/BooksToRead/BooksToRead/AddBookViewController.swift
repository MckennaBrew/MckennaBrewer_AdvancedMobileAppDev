//
//  AddBookViewController.swift
//  BooksToRead
//
//  Created by Mckenna Brewer on 2/14/21.
//

import UIKit

class AddBookViewController: UIViewController {

    
    @IBOutlet weak var bookTextField: UITextField!
    
    var addedBook = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            // only add country if there is text in the textfield
            if bookTextField.text?.isEmpty == false{
                addedBook=bookTextField.text!
            }
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
