//
//  LikeControl.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 02.04.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var counterLabel: UILabel?

    var likeCounter: Int = 0

    override var isSelected: Bool {
        didSet {
            guard oldValue != isSelected else { return }
            imageView?.image = isSelected ? UIImage(named: "likeFull") : UIImage(named: "LikeClear")

            if isSelected {
                likeCounter += 1
            } else {
                likeCounter -= 1
            }

            counterLabel?.text = "\(likeCounter)"
        }
    }
}
