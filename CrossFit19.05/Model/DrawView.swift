//
//  DrawView.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 01.04.2022.
//

import UIKit

class DrawView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 22

    }
}

class ShadowView: UIView {

    @IBInspectable var shadowRadius: CGFloat = 8
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var shadowColor = UIColor.black.cgColor
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 5, height: 5)

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.borderWidth = 2
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 22
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset

    }
}
