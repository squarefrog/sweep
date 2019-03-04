//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// Make dealing with reuse identifiers easier
protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

/// Make all `UICollectionViewCell` objects reusable
extension UICollectionViewCell: ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
