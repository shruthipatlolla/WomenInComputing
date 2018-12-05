//
//  SoundViewController.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 12/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    
    static var  soundVC:SoundViewController = SoundViewController()
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSound(_ sender: Any) {
        playSound(file: "test", ext: "mp3")
    }
    
    func playSound(file:String, ext:String) -> Void {
        do {
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: file, ofType: ext)!)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
}


