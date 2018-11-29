//
//  UserModel.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 10/20/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation


struct User {
    var name:String
    var email:String
    var password:String
}

struct Users {
    static var users = Users()
    private var userList:[User]
    private var currentUser:BackendlessUser = BackendlessUser()
    private var userScore:Int = 0
    private var levelsCompleted = 0
    init() {
        userList = [User(name: "testuser", email: "testuser@gmail.com", password: "testuser")]
    }
    mutating func addUser(_ user:User) {
        userList.append(user)
    }
    func user(_ index:Int) -> User {
        return userList[index]
    }
    
    mutating func setCurrentUser(user:BackendlessUser) -> Void {
        currentUser = user
    }
    
    func getCurrentUser() -> BackendlessUser{
        return currentUser
    }
    
    mutating func setScore(score:Int) -> Void {
        userScore = score
        print(score)
    }
    
    func getScore() -> Int{
        return userScore
    }
    
    mutating func setLevelsCompleted(completed:Int) -> Void {
        levelsCompleted = completed
        print(levelsCompleted)
    }
    
    func getLevelsCompleted() -> Int{
        return levelsCompleted
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
