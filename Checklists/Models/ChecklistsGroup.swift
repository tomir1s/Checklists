//
//  ChecklistsGroup.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/18/22.
//

import Foundation

struct ChecklistGroup {
    let title: String
    let imageName: String
    var items: [ChecklistItem]
    
    func getReaminings() -> String {
        // 1. To Do
        // 2. All done
        var isAllDone = true
        for item in items {
            if item.isChecked == false {
                isAllDone = false
            }
        }
        // 3. (No items)
        if items.isEmpty {
            return "(No items)"
        } else if !isAllDone, items.count != 0 {
        // 4. n Remaining
            return "\(items.count) Remaining"
       }
        if isAllDone {
            return "All Done"
        } else {
            return "Incorrect data"
        }
    }
}


