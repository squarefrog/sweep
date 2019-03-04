//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A partial mock of a `UICollectionView` that allows capturing of values
final class CollectionViewPartialMock: UICollectionView {
    /// A cell to return from `dequeueReusableCell(withReuseIdentifier:for:)`
    let cell: UICollectionViewCell

    /// The reuse identifier passed into `dequeueReusableCell(withReuseIdentifier:for:)`
    var reuseIdentifier: String?

    /// Initialise the partial mock with a specific cell to return later
    init(cell: UICollectionViewCell) {
        self.cell = cell
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
    }

    /// Thanks UIKit...
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Override dequeueReusableCell so we can pass back a cell without having to register
    /// the cell first
    override func dequeueReusableCell(withReuseIdentifier identifier: String,
                                      for indexPath: IndexPath) -> UICollectionViewCell {
        // Capture reuse identifier
        reuseIdentifier = identifier

        // Return stubbed cell
        return cell
    }
}
