//
//  SecondViewController.swift
//  Women In Computing
//
//  Created by Student on 10/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var passwordLbl: UILabel!
    
    @IBOutlet weak var contactNumberLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var soundEffectsSwitch: UISwitch!
    
    @IBOutlet weak var musicSwitch: UISwitch!
    
    
    
    
}

