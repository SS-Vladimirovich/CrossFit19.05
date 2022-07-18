//
//  PhotoPostTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.06.2022.
//

import UIKit

class PhotoPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhotoPost: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imagePhotoPost.image = nil
    }

    func configureOne(_ url: String) {
        imagePhotoPost.loadImage(url)
    }
    
    func configureOne(_ image: UIImage?) {
        imagePhotoPost.image = image
    }
}
