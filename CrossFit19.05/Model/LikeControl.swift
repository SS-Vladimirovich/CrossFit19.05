//
//  LikeControl.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 02.04.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var imageViewClear: UIImageView?
    @IBOutlet weak var imageViewNoClear: UIImageView?
    @IBOutlet weak var counterLabel: UILabel?

    var likeCounter: Int = 0
    var isFlipped = false

    @IBAction func likeBatton(_ sender: Any) {

        isFlipped = !isFlipped
        let fromView = isFlipped ? imageViewClear : imageViewNoClear
        let toView = isFlipped ? imageViewNoClear : imageViewClear

        if fromView == imageViewNoClear {
            likeCounter -= 1
        } else {
            likeCounter += 1
        }

        counterLabel?.text = "\(likeCounter)"

        UIView.transition(from: fromView!, to: toView!, duration: 1, options: [.curveEaseOut, .transitionFlipFromLeft, .showHideTransitionViews])

    }
}
