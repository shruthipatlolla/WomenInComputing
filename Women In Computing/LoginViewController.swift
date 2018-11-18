//
//  LoginViewController.swift
//  Women In Computing
//
//  Created by Shruthi  Patlolla on 10/20/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var womenIV: UIImageView!
    @IBAction func register(segue:UIStoryboardSegue){}
    @IBAction func cancel(segue:UIStoryboardSegue){}
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        //getImages()
        // Do any additional setup after loading the view.
    }
    
    func getImages(){
        let urlSession = URLSession.shared
        let url = URL(string: "https://api.backendless.com/BE684B7E-3E46-F431-FF2A-6D85608A5000/console/knjdepgsvtatfibointuddautdcnkpekegxd/files/view/maxresdefault.jpg")
        urlSession.downloadTask(with: url!) { localURL, urlResponse, error in
            if let localURL = localURL {
                if let string = try? String(contentsOf: localURL) {
                    //womenIV.image = UIImage(
                    print(string)
                }
            }
        }.resume()
        

    }
    
    /*func addImages(data:Data?,  urlResponse:URLResponse?,  error:Error?){
        Women.women.addImages(image:UIImage(data: data!)!)
    }*/
    
    func display(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "login"{
        if let userName = userNameTF.text , let password = passwordTF.text, !userName.isEmpty, !password.isEmpty {
            if !Users.users.isValid(userName: userName, password: password) {
                display(title: "Invalid Details", msg: "Please enter correct ID and password")
                
            }
            else{
                
            }
        } else {
            display(title: "Enter Details", msg: "Please enter the user name and password")
        }
    }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    

}

extension Notification.Name  {
    static let  dataFetched = Notification.Name("dataFetched")
    
}
