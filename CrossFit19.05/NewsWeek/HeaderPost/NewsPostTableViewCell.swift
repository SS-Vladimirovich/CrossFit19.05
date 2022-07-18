//
//  NewsPostTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.06.2022.
//

import UIKit

class NewsPostTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var namePost: UILabel!
    @IBOutlet weak var createPost: UILabel!
    @IBOutlet weak var menuPost: UIButton!

    func configure(with newsModel: NewsModel) {
        namePost.text = newsModel.creatorName
        createPost.text = newsModel.getStringDate()
        imagePost.loadImage(newsModel.avatarURL ?? "")
    }
}
