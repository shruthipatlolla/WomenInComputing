//
//  FamousWomenTableViewController.swift
//  Women In Computing
//
//  Created by Bhavika Padidala on 10/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class FamousWomenTableViewController: UITableViewController {
    
    static var famousWomenTVC:FamousWomenTableViewController = FamousWomenTableViewController()
    //let backendless = Backendless.sharedInstance()!
    //var  womenDataStore:IDataStore!
    var allWomen:[Women] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        retrieveDataFromJSON()
    }
    
    func retrieveDataFromJSON(){
        let mainBundle = Bundle.main
        let aPath = mainBundle.path(forResource: "WomenInComputing", ofType: "txt")
        let content = try? Data(contentsOf: URL(fileURLWithPath: aPath!))
        let decoder = JSONDecoder()
        self.allWomen = try! decoder.decode([Women].self, from: content!)
        AllWomen.allWomen.setWomenList(womenList: self.allWomen)
//        catch{
////            print(errors)
//        }
    }
    
    @objc func dataFetched() {
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allWomen.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let image = tableView.viewWithTag(100) as! UIImageView!
        let name = tableView.viewWithTag(200) as! UILabel!
        let desc = tableView.viewWithTag(300) as! UITextView!
        
        image?.image = UIImage(named: allWomen[indexPath.row].image)
        name?.text = allWomen[indexPath.row].name
        desc?.text = allWomen[indexPath.row].imageDescription
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}


