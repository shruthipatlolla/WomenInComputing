//
//  FamousWomenTableViewController.swift
//  Women In Computing
//
//  Created by Student on 10/4/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class FamousWomenTableViewController: UITableViewController {
let names = ["Maxres", "Edith Clarke", "Grace Hopper"]
    let images = [#imageLiteral(resourceName: "maxresdefault"),#imageLiteral(resourceName: "68065028_134808027444"),#imageLiteral(resourceName: "Grace")]
    let descp = ["Edith Clarke was the first female electrical engineer at the University of Texas at Austin. She specialized in electrical power system analysis.", "Jean Jennings Bartik was one of the original programmers for the ENIAC computer. She studied mathematics in school then began manually calculating ballistics trajectories", "Grace Brewster Murray Hopper was an American computer scientist. she was a pioneer of computer programming"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let image = tableView.viewWithTag(100) as! UIImageView!
        let name = tableView.viewWithTag(200) as! UILabel!
        let desc = tableView.viewWithTag(300) as! UITextView!
        
        image?.image = images[indexPath.row]
        name?.text = names[indexPath.row]
        desc?.text = descp[indexPath.row]


        // Configure the cell...

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
