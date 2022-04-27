//
//  DateTableViewCell.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/25/22.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
