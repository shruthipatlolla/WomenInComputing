//
//  UserModel.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 10/20/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import AVFoundation

//User struct represents the user model in the application
struct User {
    var name:String
    var email:String
    var password:String
}

// represents the users functions
struct Users {
    static var users = Users()
    private var userList:[User]
    private var currentUser:BackendlessUser = BackendlessUser()
    private var userScore:Int = 0
    private var levelsCompleted = 0
    
    var audioPlayer:AVAudioPlayer!
    
    init() {
        userList = [User(name: "testuser", email: "testuser@gmail.com", password: "testuser")]
    }
    
    //adds the user to list
    mutating func addUser(_ user:User) {
        userList.append(user)
    }
    
    //returns the user at particular index
    func user(_ index:Int) -> User {
        return userList[index]
    }
    
    //set the logged in user to current user
    mutating func setCurrentUser(user:BackendlessUser) -> Void {
        currentUser = user
    }
    
    //returns the current user
    func getCurrentUser() -> BackendlessUser{
        return currentUser
    }
    
    // sets the user score to score
    mutating func setScore(score:Int) -> Void {
        userScore = score
        print(score)
    }
    
    // returns the user's current score
    func getScore() -> Int{
        return userScore
    }
    
    // sets the number of levels completed by the user to levelsCompleted
    mutating func setLevelsCompleted(completed:Int) -> Void {
        levelsCompleted = completed
        print(levelsCompleted)
    }
    
    // returns the number of levels completed
    func getLevelsCompleted() -> Int{
        return levelsCompleted
    }
    
    // function to play the required sounds in the application
    mutating func playSound(file:String, ext:String) -> Void {
        do {
            let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: file, ofType: ext)!)
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
   /** func isValid(userName:String, password:String) -> Bool {
        var valid = false
        for user in userList {
            if userName == user.email {
                if password == user.password {
                    valid = true
                }
            }
        }
        return valid
    } **/
}
