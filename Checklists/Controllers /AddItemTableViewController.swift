//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/25/22.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    
    var item: ChecklistItem?
    var textFieldValue: String = ""
    var switchValue: Bool = false
    var dueDateValue: Date?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let item = item {
            if item.remindMe {
                return 3
            } else {
                return 2
            }
        } else {
            return 3
        }
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldTableViewCell
            if let item = item {
                cell.addItemTextField.text = item.name
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchTableViewCell
            cell.switchRemind.setOn(item?.remindMe ?? false, animated: true)
            cell.onSwitchChange = { [weak self] in
                print("я внутри клоужера")
                self?.item?.remindMe = cell.switchRemind.isOn
                tableView.reloadData()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DateTableViewCell
            if let item = item, let date = item.dueDate
            {
            cell.datePicker.setDate(date, animated: true)
            }
         
            return cell
        }
    }
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        let newItem = ChecklistItem(isChecked: false, name: textFieldValue, remindMe: switchValue, dueDate: dueDateValue)
        let object: (ChecklistItem, String) = (newItem, "Birthdays")
        NotificationCenter.default.post(name: .noteHasBeenCreated, object: object)
    }
    // create object - тип объекта Tuple: (ChecklistItem, String)
    // заполнить объект - забрать y ячеек их значения
    // передать через нотификацию при нажатии на кнопочку "Done" - ChecklistItem
    // обработать данные на первом экране - 
}



