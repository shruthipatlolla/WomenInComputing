//
//  model.swift
//  Women In Computing
//
//  Created by Padidala,Bhavika on 10/19/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
class Women : NSObject, Decodable{
    
    static var women:Women = Women()
    
    var imageDescription:String
    var  name:String
    var image:String
    //var images = ["maxresdefault.jpg", "68065028_134808027444.jpg", "Grace.jpg"]
    //var images:[UIImage] = []
    
    //private var womenList:[Women] = []
    
    override var  description:  String  {
        //  NSObject  adheres  to  CustomStringConvertible
        return "Name:  \(name  ??  ""),  Description:  \(imageDescription)"
        
    }
   
    /*func getImage(index:Int) -> UIImage{
        return images[index]
    }*/
    
    init(description: String,name:String, image:String){
        self.name  =  name
        self.imageDescription = description
        self.image = image
    }
    convenience override init(){
        self.init(description:"", name:"", image:"")
        
    }
    
    /*func setWomenList(womenList:[Women]) {
        self.womenList = womenList
    }
    
    func getAllWomenList() -> [Women] {
        return womenList
    }*/
    /*func addImages(image:UIImage){
        images.append(image)
    }*/
    
    
    
}
