//
//  LoginViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 15.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var oneCircle: UIView!
    @IBOutlet weak var twoCircle: UIView!
    @IBOutlet weak var treeCircle: UIView!

//    override func viewDidLoad() {
//        super.viewDidLoad()

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

//MARK: - One

        oneCircle.layer.masksToBounds = true
        oneCircle.layer.borderWidth = 2
        oneCircle.layer.borderColor = UIColor.black.cgColor
        oneCircle.layer.cornerRadius = oneCircle.frame.size.width / 2

//MARK: - Two

        twoCircle.layer.masksToBounds = true
        twoCircle.layer.borderWidth = 2
        twoCircle.layer.borderColor = UIColor.black.cgColor
        twoCircle.layer.cornerRadius = oneCircle.frame.size.width / 2

//MARK: - Tree

        treeCircle.layer.masksToBounds = true
        treeCircle.layer.borderWidth = 2
        treeCircle.layer.borderColor = UIColor.black.cgColor
        treeCircle.layer.cornerRadius = oneCircle.frame.size.width / 2

//MARK: - Animate

        UIView.animateKeyframes(withDuration: 2,
                                delay: 1,
                                options: [.repeat],
                                animations: {

            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.5,
                animations: {
                    self.oneCircle.alpha = 0
                })

            UIView.addKeyframe(
                withRelativeStartTime: 0.5,
                relativeDuration: 0.5,
                animations: {
                    self.oneCircle.alpha = 1
                })

        }, completion: nil)

        UIView.animateKeyframes(withDuration: 2,
                                delay: 1.5,
                                options: [.repeat],
                                animations: {

            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.5,
                animations: {
                    self.twoCircle.alpha = 0
                })

            UIView.addKeyframe(
                withRelativeStartTime: 0.5,
                relativeDuration: 0.5,
                animations: {
                    self.twoCircle.alpha = 1
                })

        }, completion: nil)

        UIView.animateKeyframes(withDuration: 2,
                                delay: 2,
                                options: [.repeat],
                                animations: {

            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.5,
                animations: {
                    self.treeCircle.alpha = 0
                })

            UIView.addKeyframe(
                withRelativeStartTime: 0.5,
                relativeDuration: 0.5,
                animations: {
                    self.treeCircle.alpha = 1
                })

        }, completion: nil)
    }
}

