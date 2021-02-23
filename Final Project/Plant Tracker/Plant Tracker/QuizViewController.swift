//
//  QuizViewController.swift
//  Plant Tracker
//
//  Created by Mckenna Brewer on 2/21/21.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    var questions = ["Why do you want a plant?", "How much natural light does your home typically get?", "Have you owned house plants before?", "How much space does your living environment currently have?", "How busy is your schedule?", "Do you have a good memory?" ]
    
    var button1 = ["I want a decoration for my living space",  "Not a lot", "Never", "Very little", "Not busy at all", "Not at all" ]
    
    var button2 = ["I want to bring life to my environment",  "A fairly decent amount", "I have had one or two", "A pretty good amount", "Somewhat busy", "Average" ]
    
    var button3 = ["I want something that I can take care of",  "A lot", "I have had lots of plants before", "Lots of extra space", "Extremely busy", "Very good" ]
    
    var count = 0
    
    var currentIndex = 0
     
    var plantList = [PlantData]()
    var plantData = PlantDataLoader()
    let dataFile = "Plants"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        plantData.loadPlants(filename: dataFile)
        plantList = plantData.getPlants()
        
        
        
        updateQuiz()
    }
    
    func updateQuiz(){
        //update the question and button text
        questionLabel.text = questions[currentIndex]
        
        answer1Button.setTitle(button1[currentIndex], for: .normal)
        
        answer2Button.setTitle(button2[currentIndex], for: .normal)
        
        answer3Button.setTitle(button3[currentIndex], for: .normal)
    }
    
    func getResults(count: Int) -> String{
        // 6 x 3 = 18
        // 6-10 = very easy
        // 11-14 = easy
        // 15-18 = a little bit of a challenge
        var result = ""
        
        if count <= 10{
            let randomIndex = Int.random(in: 0...18)
            
            //NSLog("Plant: \(plantList[randomIndex])")
            let plant = plantList[randomIndex].name
            
            
           result = "You should get a \(plant)!"
        }
        else if count <= 14{
            let randomIndex = Int.random(in: 19...39)
            let plant = plantList[randomIndex].name
            result = "You should get a \(plant)!"
        }
        else{
            let randomIndex = Int.random(in: 40...60)
            let plant = plantList[randomIndex].name
            result = "You should get a \(plant)!"
        }
        
        return result
    }
    
    
    @IBAction func makeQuiz(_ sender: UIButton) {
        
        if currentIndex >= 5 {
        // quiz is finished...generate an answer for the user based off of the count
            
            let result = getResults(count: count)
            
            questionLabel.text = result
            
            answer1Button.setTitle("", for: .normal)
            answer2Button.setTitle("", for: .normal)
            answer3Button.setTitle("", for: .normal)
            
        }
        else{ // quiz has not cycled through all the questions
            
            currentIndex += 1
                
            if sender.tag == 0{  // button 1
                count = count + 1
            }
            else if sender.tag == 1{ // button 2
                count = count + 2
            }
            else if sender.tag == 2{ // button 3
                count = count + 3
            }
            
            NSLog("Count: \(count)")
            
            updateQuiz()
        }
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
