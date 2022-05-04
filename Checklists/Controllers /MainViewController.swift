//
//  ViewController.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/15/22.
//

import UIKit

class MainViewController: UITableViewController {

    let groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays",items: [ChecklistItem(isChecked: true, name: "Tim's Birthday", remindMe: true, dueDate: Date())]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: [ChecklistItem(isChecked: false, name: "Buy milk and cookies", remindMe: false, dueDate: nil)]),
        ChecklistGroup(title: "To Do", imageName: "Inbox", items: [ChecklistItem(isChecked: true, name: "Walk the dog", remindMe: true, dueDate: Date())]),
        ChecklistGroup(title: "Business stuff", imageName: "Folder", items: [ChecklistItem(isChecked: false, name:"Business", remindMe: false, dueDate: nil)])
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group = groups[indexPath.row]
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = group.title
        cell.iconView.image = UIImage(named: group.imageName)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails",
        let vc = segue.destination as? GroupDetailsTableViewController,
        let indexPath = tableView.indexPathForSelectedRow {
        vc.title = groups[indexPath.row].title
        vc.items = groups[indexPath.row].items
                }
     }
}

