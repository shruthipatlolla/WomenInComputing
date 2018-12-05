//
//  SettingsViewController.swift
//  Women In Computing
//
//  Created by student on 10/5/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
//View controller to adjust the settings
class SettingsViewController: UIViewController {

    @IBOutlet weak var userNameLbl: UILabel!
  
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var soundEffectsSwitch: UISwitch!
    
    
    @IBOutlet weak var musicSwitch: UISwitch!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        let user = Users.users.getCurrentUser()
        self.userNameLbl.text = user.name as String
        self.emailLbl.text = user.email as String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
