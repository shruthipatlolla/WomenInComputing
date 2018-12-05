//
//  FirstViewController.swift
//  Women In Computing
//
//  Created by Student on 10/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

// View Controller to represent the game functionality
class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var backendless = Backendless.sharedInstance()
    
    var levelNumber = AllWomen.allWomen.getLevelNumber()
   
    @IBOutlet weak var womenDescLBL: UITextView!
    @IBOutlet weak var womenImage: UIImageView!
    
    @IBOutlet weak var answerTF: UITextField!
    @IBOutlet weak var answerDropdown: UIPickerView!
    var randomNumber = 0
    var randomNumbersList:[Int] = []
    
    let womenList = AllWomen.allWomen.getAllWomenList()
   
    var answerList:[String] = []
    var corectAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
//        womenImage.layer.cornerRadius = womenImage.frame.size.width/2
//        womenImage.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        randomNumber = generateRandomNumber()
        womenDescLBL.text = womenList[randomNumber].imageDescription
        womenImage.image = UIImage(named: womenList[randomNumber].image)
        answerList = []
        var otherOptions = uniqueRandoms(numberOfRandoms: 2, maxNum: UInt32(womenList.count), blackList: randomNumber)
        print(womenList[randomNumber].name)
        answerList.append(womenList[randomNumber].name)
        answerList.append(womenList[otherOptions[0]].name)
        answerList.append(womenList[otherOptions[1]].name)
        answerList = answerList.shuffled()
        answerDropdown.delegate = self;
        
        
    }
    // to display required alerts
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)

    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // testCommit
    }

    @IBAction func onNext(_ sender: Any) {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return answerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.answerTF.text = self.answerList[row]
        //self.answerDropdown.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.answerTF {
            self.answerDropdown.isHidden = false
            //if you don't want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
    }
    
    //function to generate random number withi n the mentioned range
    func generateRandomNumber() -> Int {
        var randomNumber = -1
        repeat {
            randomNumber = Int(arc4random_uniform(UInt32(levelNumber*2)))
        } while randomNumbersList.contains(randomNumber)
        randomNumbersList.append(randomNumber)
        //print(randomNumber)
            
        return randomNumber
    }
    
    //To generate certain number of unique random numbers with in the range
    func uniqueRandoms(numberOfRandoms: Int, maxNum: UInt32, blackList: Int?) -> [Int] {
        var uniqueNumbers = Set<Int>()
        while uniqueNumbers.count < numberOfRandoms {
            uniqueNumbers.insert(Int(arc4random_uniform(maxNum)))
        }
        if let blackList = blackList {
            if uniqueNumbers.contains(blackList) {
                while uniqueNumbers.count < numberOfRandoms+1 {
                    uniqueNumbers.insert(Int(arc4random_uniform(maxNum)))
                }
                uniqueNumbers.remove(blackList)
            }
        }
        return Array(uniqueNumbers).shuffled()
    }
   
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "onGo"{
            if String(answerTF.text!) == womenList[randomNumber].name{
                self.corectAnswers = self.corectAnswers + 1
                Users.users.setScore(score: Users.users.getScore()
                + 5)
            }
            
        if(randomNumbersList.count < levelNumber*2){
            viewWillAppear(true)
            return false
        }
        else{
            if self.corectAnswers == levelNumber*2 {
                Users.users.setLevelsCompleted(completed: levelNumber)
                display(title: "Success", msg: "Completed the level successfully")
                Users.users.playSound(file: "success", ext: "mp3")
            }
            else{
                display(title: "Try again", msg: "You have answered \(self.corectAnswers) correct")
            }
            // Updating User score and levels completed data to database
            var currentUser = Users.users.getCurrentUser()
            let properties = [
                "score" : Users.users.getScore(),
                "levels" : Users.users.getLevelsCompleted()
            ]
            currentUser.updateProperties( properties )
            self.backendless?.userService.update(currentUser,
                                                 response: { ( updatedUser : BackendlessUser!) -> () in
                                                    print("Updated user: \(updatedUser)")
                                                    
            },
                                                 
                                                 error: { ( fault : Fault!) -> () in
                                                    print("Server reported an error (2): \(fault)")
            })
            
            
            }
        return true
        }
        else{
            return true
        }
    }
    
}

