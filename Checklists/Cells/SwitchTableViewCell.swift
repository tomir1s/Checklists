//
//  SwitchTableViewCell.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/25/22.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

   
    @IBOutlet weak var switchRemind: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    @IBAction func switchDidChange(_ sender: UISwitch) {
        print("switch value: \(sender.isOn)")
    }
}
