//
//  FirstViewController.swift
//  Women In Computing
//
//  Created by Student on 10/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
   
    @IBOutlet weak var womenDescLBL: UITextView!
    @IBOutlet weak var womenImage: UIImageView!
    
    @IBOutlet weak var answerTF: UITextField!
    @IBOutlet weak var answerDropdown: UIPickerView!
    var randomNumber = 0
    var randomNumbersList:[Int] = []
    
    //var womenList = Women.women.getAllWomenList()
    var answerList:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testcommit
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        randomNumber = generateRandomNumber()
        
       /* womenDescLBL.text = womenList[randomNumber].imageDescription
       // womenImage.image = UIImage(named: Women.women.images[randomNumber])
        
        var otherOptions = uniqueRandoms(numberOfRandoms: 2, maxNum: 3, blackList: randomNumber)
        answerList = []
        answerList.append(womenList[randomNumber].name)
        answerList.append(womenList[otherOptions[0]].name)
        answerList.append(womenList[otherOptions[1]].name) */
        answerDropdown.delegate = self;
        
        
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
    
    func generateRandomNumber() -> Int {
        var randomNumber = -1
        repeat {
            randomNumber = Int(arc4random_uniform(3))
        } while randomNumbersList.contains(randomNumber)
        randomNumbersList.append(randomNumber)
        print(randomNumber)
            
        return randomNumber
    }
    
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
        if(randomNumbersList.count < 3){
            viewWillAppear(true)
            return false
        }
        return true
    }
    
}

