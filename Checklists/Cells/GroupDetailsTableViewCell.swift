//
//  GroupDetailsTableViewCell.swift
//  Checklists
//
//  Created by Jafar Asimov on 4/22/22.
//

import UIKit

class GroupDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoCircleView: UIImageView!
    @IBOutlet weak var chevronRightView: UIImageView!
    @IBOutlet weak var checkmarkView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
