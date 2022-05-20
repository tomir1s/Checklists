//
//  TextFieldTableViewCell.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/25/22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    var textFieldValueOnChange: ((String) -> Void)?
    
    @IBOutlet weak var addItemTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func didTextFieldChange(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        textFieldValueOnChange?(text)
        }
    }
}
