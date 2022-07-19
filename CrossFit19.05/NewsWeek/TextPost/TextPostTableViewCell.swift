//
//  TextPostTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.06.2022.
//

import UIKit

class TextPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textPost: UILabel!
    
    func configure(with newsModel: NewsModel) {
        textPost.text = newsModel.text
    }
}
