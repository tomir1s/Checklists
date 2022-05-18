//
//  ViewController.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/15/22.
//

import UIKit

class MainViewController: UITableViewController, GroupDetailsProtocol {

    //MARK: - GroupDetailsProtocol
    func didDeleteItem(at index: Int, with groupTitle : String) {
        for (groupIndex, group) in groups.enumerated() {
            if group.title == groupTitle {
            groups[groupIndex].items.remove(at: index)
            tableView.reloadData()
            }
        }
                
                
    }
    

    var groups: [ChecklistGroup] = [
        ChecklistGroup(title: "Birthdays", imageName: "Birthdays",items: [ChecklistItem(isChecked: true, name: "Tim's Birthday", remindMe: true, dueDate: Date())]),
        ChecklistGroup(title: "Groceries", imageName: "Groceries", items: [ChecklistItem(isChecked: false, name: "Buy milk and cookies", remindMe: false, dueDate: nil)]),
        ChecklistGroup(title: "To Do", imageName: "Inbox", items: [ChecklistItem(isChecked: true, name: "Walk the dog", remindMe: true, dueDate: Date())]),
        ChecklistGroup(title: "Business stuff", imageName: "Folder", items: [])
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // follow to notification about creating notes
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddNoteNotification), name: .noteHasBeenCreated, object: nil)
    }
    
    @objc
    func handleAddNoteNotification(_ notification: Notification) {
        if let object = notification.object as? (ChecklistItem, String) {
        print("Обрабатываю добавление новой заметки")
            print("Получил значение: \(object.1)")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group = groups[indexPath.row]
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = group.title
        cell.iconView.image = UIImage(named: group.imageName)
        cell.subtitleLabel.text = group.getReaminings()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails",
        let vc = segue.destination as? GroupDetailsTableViewController,
        let indexPath = tableView.indexPathForSelectedRow {
        vc.group = groups[indexPath.row]        
        vc.delegate = self
                }
     }
    

   
}
 
