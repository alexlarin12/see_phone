//
//  TwoTitleTableViewController.swift
//  Project7
//
//  Created by пользователь on 21/05/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    var groups: [GroupModel] = [
        GroupModel(nameGroup : "Jokes"),
        GroupModel(nameGroup : "Soft"),
        GroupModel(nameGroup : "English"),
        GroupModel(nameGroup : "Spanish")
    ]
        override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier, for: indexPath)as? GroupCell else { return UITableViewCell()}
        
        cell.groupNameLabel.text = groups[indexPath.row].nameGroup
    
        
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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

    
    // MARK: - Navigation

    @IBAction func addGroup(segue: UIStoryboardSegue){
        if let controller = segue.source as? AnyGroupsTableViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow{
            let group = controller.groups[indexPath.row]
            
            guard !groups.contains(where: { $0.nameGroup == group.nameGroup }) else {return}
            groups.append(group)
            let newIndexPath = IndexPath(item: groups.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
    }
    

}
