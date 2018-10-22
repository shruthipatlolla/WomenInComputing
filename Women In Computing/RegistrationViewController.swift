//
//  RegistrationViewController.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 10/20/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func textFieldDidChange(textField: UITextField) {
        if firstNameTF.text!.isEmpty || lastNameTF.text!.isEmpty {
            //Disable button
            let  alert  =  UIAlertController(title:  "Alert",  message:  "Enter the details properly",  preferredStyle:  .alert)
            alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
            self.present(alert,  animated:  true,  completion:  nil)
        } else {
            //Enable button
            print("done")
        }
    }
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func isValidPassword(testStr:String) -> Bool{
        return testStr.count >= 8
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "register"{
            let user = User(name: firstNameTF.text! + lastNameTF.text!, email: emailTF.text!, password: passwordTF.text!)
            
                if firstNameTF.text!.isEmpty || lastNameTF.text!.isEmpty {
                    //Disable button
                    let  alert  =  UIAlertController(title:  "Alert",  message:  "Enter the details properly",  preferredStyle:  .alert)
                    alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                    self.present(alert,  animated:  true,  completion:  nil)
                }
                if (!isValidEmail(testStr: emailTF.text!)){
                    print("email")
                    let  alert  =  UIAlertController(title:  "Alert",  message:  "Enter the correct email id",  preferredStyle:  .alert)
                    alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                    self.present(alert,  animated:  true,  completion:  nil)
                    
                }
                print(passwordTF.text!)
                print(confirmPasswordTF.text!)
            if(!isValidPassword(testStr: passwordTF.text!)){
                print("email")
                let  alert  =  UIAlertController(title:  "Alert",  message:  "Enter Password of length more than 8",  preferredStyle:  .alert)
                alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                self.present(alert,  animated:  true,  completion:  nil)
            }
                if(passwordTF!.text != confirmPasswordTF!.text){
                    let  alert  =  UIAlertController(title:  "Alert",  message:  "Password is unmatched",  preferredStyle:  .alert)
                    alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                    self.present(alert,  animated:  true,  completion:  nil)
                }
            
            else{
                Users.users.addUser(user)
                display(title: "Success", msg: "Registered successfully" )
            }
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "register" {
            print("In can")
            let user = User(name: firstNameTF.text! + lastNameTF.text!, email: emailTF.text!, password: passwordTF.text!)
        
                print("in valid email")
                if firstNameTF.text!.isEmpty || lastNameTF.text!.isEmpty || passwordTF.text!.isEmpty || confirmPasswordTF.text!.isEmpty {
                    print("fname")
                    //Disable button
                    let  alert  =  UIAlertController(title:  "Alert",  message:  "Missing details",  preferredStyle:  .alert)
                    alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                    self.present(alert,  animated:  true,  completion:  nil)
                    return false;
                }
                if (!isValidEmail(testStr: emailTF.text!)){
                    print("email")
                    let  alert  =  UIAlertController(title:  "Alert",  message:  "Enter the correct email id",  preferredStyle:  .alert)
                    alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                    self.present(alert,  animated:  true,  completion:  nil)
                    return false;
                }
            if(!isValidPassword(testStr: passwordTF.text!)){
                print("email")
                let  alert  =  UIAlertController(title:  "Alert",  message:  "Enter Password of length more than 8",  preferredStyle:  .alert)
                alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                self.present(alert,  animated:  true,  completion:  nil)
            }
            print(passwordTF.text!)
            print(confirmPasswordTF.text!)
                if(passwordTF.text! != confirmPasswordTF.text!){
                    let  alert  =  UIAlertController(title:  "Alert",  message:  "Password is Unmatched",  preferredStyle:  .alert)
                    alert.addAction(UIAlertAction(title:  "OK",  style:  .default,  handler:  nil))
                    self.present(alert,  animated:  true,  completion:  nil)
                    return false;
                }
        
            
        }
        return true;
    }
    

}
