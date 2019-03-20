//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

extension UICollectionView {
    var indexPathForCenterItem: IndexPath? {
        let x = center.x + contentOffset.x
        let y = center.y + contentOffset.y
        let centerPoint = CGPoint(x: x, y: y)

        return indexPathForItem(at: centerPoint)
    }
}
