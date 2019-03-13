//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

protocol PotCellPresentable: CellPresentable { }

extension PotCellPresentable {
    /// The reuse identifier for the cell
    var reuseIdentifier: String {
        return PotCell.reuseIdentifier
    }

    /// Register the card cell
    ///
    /// - Parameter collectionView: The collection view to register the cell in
    func registerCardCell(in collectionView: UICollectionView) {
        collectionView.register(PotCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
