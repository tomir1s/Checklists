//
//  GroupDetailsTableViewController.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/22/22.
//

import UIKit

// TODO:
// 1. create massive with our data
// 2. 
// 3.

class GroupDetailsTableViewController: UITableViewController {

    var group: ChecklistGroup!
   var delegate: GroupDetailsProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return group.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let item = group.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItemCell", for: indexPath) as! GroupDetailsTableViewCell
        cell.titleLabel.text = item.name
        cell.checkmarkView.isHidden = !item.isChecked
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupDetailsToAddItem",
           let vc = segue.destination as? AddItemTableViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            vc.title = "Edit item"
            vc.item = group.items[indexPath.row]
        }
        
        if segue.identifier == "JumpToAddNewNote" ,
           let vc = segue.destination as? AddItemTableViewController {
            vc.groupTitle = group.title
        }
    
    }
    
    //MARK: - obrabotka delegate tablici or UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("pressed on cell \(indexPath.row)")
    }
      override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)   {
    
          //delete data from massive
          group.items.remove(at: indexPath.row)

        //delete cell from the table
          tableView.deleteRows(at: [indexPath], with: .automatic)
          
          delegate?.didDeleteItem(at: indexPath.row , with: group.title)
     }
   
}
