//
//  ImageServes.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 11.07.2022.
//

import UIKit

class ImageServes: UITableViewCell {

    static let identifier: String = "ImageCell"

    private let newsImageView: UIImageView = {
        let newsImageView = UIImageView()
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        return newsImageView
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }

    func configure(_ url: String) {
        newsImageView.loadImage(url)
    }

    func configure(_ image: UIImage?) {
        newsImageView.image = image
    }
}
