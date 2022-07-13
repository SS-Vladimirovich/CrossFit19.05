//
//  PhotoPostTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.06.2022.
//

import UIKit

class PhotoPostTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePhotoPost: UIImageView!

    func configure(with newsModel: NewsModel) {

        imagePhotoPost.loadImage(newsModel.photosURL)
    }
}
