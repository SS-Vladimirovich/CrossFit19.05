//
//  FotoCollectionViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var fotoFriends: UIImageView!

    var likePhoto: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)
    }

    @objc
    func likeControlTapped() {
        likeControl.isFlipped = !likeControl.isFlipped
        likePhoto?(likeControl.isFlipped)
    }
}
