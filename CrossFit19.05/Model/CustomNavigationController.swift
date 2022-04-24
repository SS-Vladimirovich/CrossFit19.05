//
//  CustomNavigationController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 22.04.2022.
//

import UIKit

class CustomNavigationController: UINavigationController {

    var interactiveTransition: CastomInteractiveTransition?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
}

extension CustomNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            interactiveTransition = CastomInteractiveTransition(popingViewController: toVC)
            return TransmitionAnimator(isPresenting: true)
        case .pop:
            return TransmitionAnimator(isPresenting: false)
        default:
            return nil
        }
    }

    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return (interactiveTransition?.hasStarted ?? false) ? interactiveTransition : nil
    }
}

class CastomInteractiveTransition: UIPercentDrivenInteractiveTransition {

    let popingViewController: UIViewController

    var hasStarted: Bool = false
    var shouldFinish: Bool = false

    init(popingViewController: UIViewController) {
        self.popingViewController = popingViewController

        super.init()

        let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action:  #selector(screenDidPan(_:)))
        recognizer.edges = .left
        popingViewController.view.addGestureRecognizer(recognizer)
    }

    @objc func screenDidPan(_ sender: UIScreenEdgePanGestureRecognizer) {
        switch sender.state {
        case . began:
            hasStarted = true
            popingViewController.navigationController?.popViewController(animated: true)

        case .changed:
            let transition = sender.translation(in: popingViewController.view)
            let relativeTransition = transition.x / popingViewController.view.bounds.width
            let progress = max(0, min(1, relativeTransition))
            shouldFinish = progress > 0.5
            update(progress)

        case .cancelled:
            hasStarted = false
            cancel()

        case .ended:
            hasStarted = false
            shouldFinish ? finish() : cancel()

        default:
            break
        }
    }
}

//MARK: - Анимация перехода

class TransmitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let animationDuration: TimeInterval = 3
    let isPresenting: Bool

    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animateForPresent(using: transitionContext)
        } else {
            animateForDismiss(using: transitionContext)
        }
    }

    func animateForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else {
            return
        }

        let containerView = transitionContext.containerView

        containerView.insertSubview(destination.view, belowSubview: source.view)

        destination.view.frame = transitionContext.finalFrame(for: destination)

        UIView.animateKeyframes(
            withDuration: animationDuration,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        source.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        source.view.frame.origin = CGPoint(x: containerView.frame.width, y: 0.0)
                    })

        },
            completion: { isComplete in
                if isComplete {
                source.removeFromParent()
                }
                transitionContext.completeTransition(isComplete && !transitionContext.transitionWasCancelled)
            })

    }

    func animateForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else {
            return
        }

        let containerView = transitionContext.containerView

        containerView.addSubview(destination.view)

        destination.view.frame = CGRect(x: 0,
                                        y: containerView.frame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)

        destination.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        UIView.animateKeyframes(
            withDuration: animationDuration,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        destination.view.center = source.view.center
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        destination.view.transform = .identity
                    })

        },
            completion: { isComplete in
                transitionContext.completeTransition(isComplete)
            })
    }
}

