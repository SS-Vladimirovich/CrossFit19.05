//
//  FriendsTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendsNameLabel: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
