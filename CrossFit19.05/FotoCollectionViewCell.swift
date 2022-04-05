//
//  FotoCollectionViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeCintrol: LikeControl!
    @IBOutlet weak var fotoFriends: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        likeCintrol.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)
    }

    @objc
    func likeControlTapped() {
        likeCintrol.isSelected = !likeCintrol.isSelected
    }
}
