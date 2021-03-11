//
//  ViewController.swift
//  ShakespeareTranslator
//
//  Created by Mckenna Brewer on 3/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textToTranslate: UITextField!
    
    @IBOutlet weak var translatedText: UILabel!
    
    var translationData = TranslationDataHandler()
    var translation: String = ""
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        translationData.onDataUpdate = {[weak self] (data: String) in self?.render()}

    }
    
    func render() {
        translation = translationData.getTranslation()
        translatedText.text = translation
    }
    
    
    @IBAction func translateText(_ sender: UIButton) {
        let translationString = buildTranslationString()
        
        translationData.loadjson(text: translationString)
    }
    
    
    @IBAction func dismissKeyboardTap(sender: AnyObject) {
           view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true   // remember func has to return
    }
 
    
    
    
    func buildTranslationString() -> String {
        var url = ""
        
        NSLog(textToTranslate.text!)
        
        let splitText = textToTranslate.text!
        
        let tempArray = splitText.split(separator: " ")
        
       
        for i in 0...(tempArray.count - 2)
        {
            url = url + tempArray[i] + "%20"
        }
        
        url = url + tempArray[tempArray.count - 1]
        
        return url
    }

}

