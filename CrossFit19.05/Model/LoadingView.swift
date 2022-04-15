//
//  LoadingView.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 15.04.2022.
//

import UIKit

class LodingView: UIView {

}



class LodingViewOne: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.size.width / 2

        UIView.animate(withDuration: 3, animations: {
            self.oneCircle.alpha = 0
        })
    }
}

class LodingViewTwo: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.size.width / 2

    }
}

class LodingViewTree: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.size.width / 2

    }
}
