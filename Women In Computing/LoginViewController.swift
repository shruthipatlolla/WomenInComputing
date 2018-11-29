//
//  LoginViewController.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 10/20/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func onLogout(segue:UIStoryboardSegue){}
    
    @IBOutlet weak var womenIV: UIImageView!
    @IBAction func register(segue:UIStoryboardSegue){}
    @IBAction func cancel(segue:UIStoryboardSegue){}
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
    }
   
    
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        Backendless.sharedInstance().userService.login(userNameTF.text!,
                                                       password: passwordTF.text!,
                                                       response: { user in
                                                        if user != nil {
                                                            let currentUser : BackendlessUser = Backendless.sharedInstance()!.userService.currentUser
                                                            Users.users.setScore(score: currentUser.getProperty("score") as! Int)
                                                            Users.users.setLevelsCompleted(completed:currentUser.getProperty("levels") as! Int)
                                                            Users.users.setCurrentUser(user: user!)
                                                           // Users.users.setScore(score: us)
                                                            self.performSegue(withIdentifier: "login", sender: user)
                                                        }
                                                        
        },error: { fault in
            self.display(title: "Login Failed", msg: (fault?.message!)!)
            
        })
        
    }
    
    
}

extension Notification.Name  {
    static let  dataFetched = Notification.Name("dataFetched")
    
}
