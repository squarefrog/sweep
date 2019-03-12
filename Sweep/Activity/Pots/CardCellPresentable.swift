//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

protocol CardCellPresentable: CellPresentable { }

extension CardCellPresentable {
    /// The reuse identifier for the cell
    var reuseIdentifier: String {
        return CardCell.reuseIdentifier
    }

    /// Register the card cell
    ///
    /// - Parameter collectionView: The collection view to register the cell in
    func registerCardCell(in collectionView: UICollectionView) {
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
