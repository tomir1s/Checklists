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

   var items: [ChecklistItem] = []
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
      
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let item = items[indexPath.row]
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
            vc.item = items[indexPath.row]
        }
    
    }

}
