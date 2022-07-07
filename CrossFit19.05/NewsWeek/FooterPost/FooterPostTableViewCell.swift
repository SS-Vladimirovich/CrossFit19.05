//
//  FooterPostTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.06.2022.
//

import UIKit

class FooterPostTableViewCell: UITableViewCell {

    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var comentsCount: UILabel!
    @IBOutlet weak var arrowCount: UILabel!
    @IBOutlet weak var eyeCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
