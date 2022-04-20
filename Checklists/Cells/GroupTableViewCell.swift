//
//  GroupTableViewCell.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/20/22.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
