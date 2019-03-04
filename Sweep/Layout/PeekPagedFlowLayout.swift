//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A custom collection view flow layout that allows peeking at the next item
class PeekPagedFlowLayout: UICollectionViewFlowLayout {
    /// The amount of interitem spacing
    let spacing: CGFloat = 20.0

    /// If the bounds change, then the layout should be invalidated
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        minimumLineSpacing = spacing

        // How much should the next cell peek into the view
        let peekAmount = spacing * 4

        // Calculate the available width for the items
        let width = collectionView.bounds.width - peekAmount
        itemSize = CGSize(width: width, height: collectionView.bounds.height)

        // Add left inset to center the cell
        sectionInset = UIEdgeInsets(top: 0, left: spacing * 2, bottom: 0, right: 0)
    }
}
