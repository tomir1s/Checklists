//
//  TextFieldTableViewCell.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/25/22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var addItemTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
