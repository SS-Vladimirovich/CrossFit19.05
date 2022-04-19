//
//  SlideShowViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 19.04.2022.
//

import UIKit

class SlideShowViewController: UIViewController {

    var photos: [FotoFriends] = []

    var countFotoIndex: Int?

    var firstPhotoIndex: Int? {
        guard let index = countFotoIndex else {
            return nil
        }

        let firstIndex = index + 1
        return firstIndex < photos.count ? firstIndex : nil
    }

    var lastPhotoIndex: Int? {
        guard let index = countFotoIndex else {
            return nil
        }

        let lastIndex = index - 1
        return lastIndex > -1 ? lastIndex : nil
    }

    var countPhoto: FotoFriends? {
        guard let index = countFotoIndex else {
            return nil
        }

        return photos[index]
    }

    @IBOutlet weak var firstView: UIImageView!
    @IBOutlet weak var lastView: UIImageView!

    var firstImageView: UIImageView? {
        [firstView, lastView].first(where: { !$0.isHidden })
    }

    var lastImageView: UIImageView? {
        [lastView, firstView].first(where: { $0.isHidden })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        countFotoIndex = photos.isEmpty ? nil : 0

        firstView.frame = view.bounds
        firstView.image = UIImage(named: countPhoto?.imageFoto ?? "")

        lastView.frame = view.bounds
        lastView.isHidden = true

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        leftSwipe.direction = .left

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        rightSwipe.direction = .right

        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
    }

    @objc func viewDidSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            swipeToRight()
        case .left:
            swipeToLeft()
        default:
            break
        }
    }

    func swipeToLeft() {
        guard let lastPhotoIndex = lastPhotoIndex else {
            return
        }

        let lastImageView = lastImageView
        let firstImageView = firstImageView

        lastImageView?.image = UIImage(named: photos[lastPhotoIndex].imageFoto)
        lastImageView?.frame.origin.x = view.bounds.maxX
        lastImageView?.isHidden = false

        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        firstImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        lastImageView?.frame.origin.x = 0
                        firstImageView?.frame.origin.x = -self.view.bounds.width
                    })

            }, completion: { _ in
                self.countFotoIndex = lastPhotoIndex
                firstImageView?.isHidden = true
                firstImageView?.transform = .identity
            })
    }

    func swipeToRight() {
        guard let firstPhotoIndex = firstPhotoIndex else {
            return
        }

        let lastImageView = lastImageView
        let firstImageView = firstImageView

        lastImageView?.image = UIImage(named: photos[firstPhotoIndex].imageFoto)
        lastImageView?.frame.origin.x = -view.bounds.width
        lastImageView?.isHidden = false

        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        firstImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        lastImageView?.frame.origin.x = 0
                        firstImageView?.frame.origin.x = self.view.bounds.width
                    })

            }, completion: { _ in
                self.countFotoIndex = firstPhotoIndex
                firstImageView?.isHidden = true
                firstImageView?.transform = .identity
            })
    }

}
