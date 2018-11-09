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
    
    static var women:Women = Women()
    
    var imageDescription:String
    var  name:String
    var images = ["maxresdefault.jpg", "68065028_134808027444.jpg", "Grace.jpg"]

    
    private var womenList:[Women] = []
    
    override var  description:  String  {
        //  NSObject  adheres  to  CustomStringConvertible
        return "Name:  \(name  ??  ""),  Description:  \(imageDescription)"
        
    }
    
    init(description: String,name:String){
        self.name  =  name
        self.imageDescription = description
    }
    convenience override init(){
        self.init(description:"", name:"")
        
    }
    
    func setWomenList(womenList:[Women]) {
        self.womenList = womenList
    }
    
    func getAllWomenList() -> [Women] {
        return womenList
    }
    
}
