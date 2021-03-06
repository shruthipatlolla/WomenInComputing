//
//  gamePage.swift
//  Women In Computing
//
//  Created by Nista Shrestha on 10/5/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

//View Controller to the level selection functionality
class LevelPageViewController: UIViewController {
    
    @IBAction func quitGame(segue:UIStoryboardSegue){}

    @IBAction func onGo(segue:UIStoryboardSegue){}
    @IBOutlet weak var level1: UIButton!
    @IBOutlet weak var level2: UIButton!
    @IBOutlet weak var level3: UIButton!
    @IBOutlet weak var level4: UIButton!
    @IBOutlet weak var level5: UIButton!
    @IBOutlet weak var level6: UIButton!
    
    @IBOutlet weak var coins: UILabel!
    
    @IBOutlet weak var coinsvalue: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var heart: UIImageView!
    
    @IBOutlet weak var gold: UIImageView!
    
    @IBAction func level1(_ sender: Any) {
        onLevelSelecton(1)
    }
    
    @IBAction func level2(_ sender: Any) {
        onLevelSelecton(2)
    }
    
    @IBAction func level3(_ sender: Any) {
        onLevelSelecton(3)
    }
    
    @IBAction func level4(_ sender: Any) {
        onLevelSelecton(4)
    }
    
    @IBAction func level5(_ sender: Any) {
        onLevelSelecton(5)
    }
    
    @IBAction func level6(_ sender: Any) {
        onLevelSelecton(6)
    }

    // functionality upon selecting the level
    func onLevelSelecton(_ level:Int){
        AllWomen.allWomen.setLevelNumber(level: level)
        let gameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "game") as! GameViewController
        self.present(gameVC, animated: true, completion: nil)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableAndEnableMultipleButtons(buttons: [level1, level2, level3, level4, level5, level6], levelsCompleted: Users.users.getLevelsCompleted())
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        disableAndEnableMultipleButtons(buttons: [level1, level2, level3, level4, level5, level6], levelsCompleted: Users.users.getLevelsCompleted())
        print(Users.users.getScore())
        coinsvalue.text! = String(Users.users.getScore())
    }
    
    // Disable and enable levels based on the user levels completed value
    func disableAndEnableMultipleButtons(buttons: [UIButton], levelsCompleted: Int) {
        var dissAble:[Bool] = []
        
        for (index, button) in buttons.enumerated() {
            if index < levelsCompleted+1{
                dissAble.append(false)
            }
            else{
                dissAble.append(true)
            }
            
            switch dissAble[index] {
            case true:
                button.isEnabled = false
                button.alpha = 0.3
            case false:
                button.isEnabled = true
                button.alpha = 1.0
            }
            
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
