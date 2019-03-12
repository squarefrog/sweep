//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

protocol AccountCellPresentable: CellPresentable { }

extension AccountCellPresentable {
    var reuseIdentifier: String {
        return AccountCell.reuseIdentifier
    }

    func registerCardCell(in collectionView: UICollectionView) {
        collectionView.register(AccountCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
