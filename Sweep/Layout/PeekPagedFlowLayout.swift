//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A custom collection view flow layout that allows peeking at the next item
class PeekPagedFlowLayout: UICollectionViewFlowLayout {
    /// The amount of interitem spacing
    let spacing: CGFloat = 30.0

    /// If the bounds change, then the layout should be invalidated
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        // Calculate the available width for the items
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let width = availableWidth - spacing * 2

        itemSize = CGSize(width: width, height: collectionView.bounds.height)
        sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        minimumLineSpacing = spacing
    }

}
