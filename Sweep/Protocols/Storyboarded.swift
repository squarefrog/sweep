//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A protocol which allows instantiation from Main.storyboard
protocol Storyboarded { }

extension Storyboarded where Self: UIViewController {
    /// Create a view controller from the storyboard. This relies on the view controllers storyboard
    /// identifier being the same as the class name
    static func instantiate() -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // swiftlint:disable:next force_cast
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
