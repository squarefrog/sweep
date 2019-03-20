//
//  Copyright © 2019 squarefrog. All rights reserved.
//
//  swiftlint:disable function_body_length

import UIKit

struct SweepAnimator {
    /// Perform an sweeping movement animation.
    ///
    /// - Parameters:
    ///   - sourceView: The view to animate
    ///   - toPosition: The end positions center point
    ///   - parentView: The enclosing view to perform the animations in
    ///   - setup: A block called before animation begins. This is called after the snapshot view is created, and
    ///     should be used to reset the source view before it reappears after animation completion.
    ///   - completion: A block to be executed when the animation ends. This block takes a single Boolean
    ///     argument which indicates whether the animation finished before the completion handler was called.
    static func move(_ sourceView: UIView,
                     toPosition: CGPoint,
                     inside parentView: UIView,
                     setup: () -> Void,
                     completion: ((Bool) -> Void)?) {

        guard let snapshotView = sourceView.snapshotView(afterScreenUpdates: true) else {
            completion?(false)
            return
        }

        snapshotView.frame = sourceView.convert(sourceView.bounds, to: parentView)
        parentView.addSubview(snapshotView)

        let layer = snapshotView.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 1.0

        sourceView.alpha = 0
        sourceView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        setup()

        UIView.animateKeyframes(withDuration: 1.4, delay: 0, options: [.calculationModeCubic], animations: {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                var center = snapshotView.center
                center.x += 50
                snapshotView.center = center
            }

            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                snapshotView.center = toPosition
            }

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                snapshotView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                snapshotView.transform = snapshotView.transform.rotated(by: -13 * CGFloat.pi / 180)
                layer.shadowRadius = 5.0
                layer.shadowOpacity = 1.0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2) {
                snapshotView.transform = .identity
                snapshotView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                layer.shadowRadius = 2.0
                layer.shadowOpacity = 0.5
            }

            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1) {
                snapshotView.alpha = 0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                sourceView.alpha = 1
                sourceView.transform = .identity
            }

        }, completion: { finished in
            if !finished {
                sourceView.alpha = 1
                sourceView.transform = .identity
            }

            snapshotView.removeFromSuperview()

            completion?(finished)
        })
    }
}
