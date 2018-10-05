//
//  FirstViewController.swift
//  Women In Computing
//
//  Created by Student on 10/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // testCommit
    }

    
    @IBAction func onGo(_ sender: Any) {
        let levelVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "levelViewController") as! gamePage
        self.present(levelVC, animated: true, completion: nil)
    }
}

