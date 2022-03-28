//
//  GroupsTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupsNameLabel: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    public func refresh(_ model: GroupsName) {
        groupsNameLabel.text = model.nameGroups
    }
}

