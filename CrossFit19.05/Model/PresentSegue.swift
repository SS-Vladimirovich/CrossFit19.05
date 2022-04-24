//
//  PresentSegue.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 21.04.2022.
//

import UIKit

class PresentSegue: UIStoryboardSegue {

    override func perform() {
        guard
            let containerView = source.view.superview else {
            return
        }

        containerView.addSubview(destination.view)

        destination.view.transform = CGAffineTransform(rotationAngle: -(.pi / 2))
        destination.view.frame = CGRect(x: containerView.frame.width,
                                        y: 0,
                                        width: source.view.frame.height,
                                        height: source.view.frame.width)

        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        self.destination.view.center = self.source.view.center
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        self.destination.view.transform = .identity
                    })

        },
            completion: { isComplete in

                self.source.present(self.destination, animated: false)

            })
    }
}
