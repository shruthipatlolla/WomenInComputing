//
//  model.swift
//  Women In Computing
//
//  Created by Padidala,Bhavika on 10/19/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

@objcMembers
class Women : NSObject{
   var image:NSData!
    var Description:String
    var  Name:String
    
    
    var  objectId:String?
    init(Description: String,name:String){
        self.Name  =  name
        self.Description = Description
    }
    convenience override init(){
        self.init(Description:"", name:"" )
        
    }
    
}
