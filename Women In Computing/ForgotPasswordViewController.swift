//
//  ForgotPasswordViewController.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 10/20/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)

        // Do any additional setup after loading the view.
    }
    
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func onRecoverPassword(_ sender: Any) {
        let email = emailTF.text! as String
        Types.tryblock({ () -> Void in
            
            let result = Backendless.sharedInstance().userService.restorePassword(email)
            //print("Check your email address! result = \(result)")
            self.display(title: "Success", msg: "Check your email address!")
        },
                       
                       catchblock: { (exception) -> Void in
                        self.display(title: "Alert", msg: "Invalid Email")
                        //print("Server reported an error: \(exception as! Fault)")
        })
        
    }
    
   
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
