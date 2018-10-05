//
//  gamePage.swift
//  Women In Computing
//
//  Created by Nista Shrestha on 10/5/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class gamePage: UIViewController {
    
    @IBOutlet weak var livesLbl: UILabel!
    
    @IBOutlet weak var livesvalue: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var timervalue: UILabel!
    
    @IBOutlet weak var coins: UILabel!
    
    @IBOutlet weak var coinsvalue: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var heart: UIImageView!
    
    @IBOutlet weak var gold: UIImageView!
    
    @IBAction func level1(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level2(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level3(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level4(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level5(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level6(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level7(_ sender: Any) {
    }
    
    @IBAction func level8(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level9(_ sender: Any) {
        onLevelSelecton()
    }
    
    
    @IBAction func level10(_ sender: Any) {
        onLevelSelecton()
    }
    
    
    @IBAction func level11(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level12(_ sender: Any) {
        onLevelSelecton()
    }
    
    @IBAction func level13(_ sender: Any) {
        onLevelSelecton()
    }
    
    
    @IBAction func level14(_ sender: Any) {
        onLevelSelecton()
    }
    
    
    @IBAction func level15(_ sender: Any) {
        onLevelSelecton()
    }
    
    func onLevelSelecton(){
        let gameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "game") as! FirstViewController
        self.present(gameVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
