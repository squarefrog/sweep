//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A generic collection view data source for displaying a flat array of `Model` items
public final class DataSource<Model>: NSObject, UICollectionViewDataSource {
    public typealias CellConfigurator = (UICollectionViewCell, Model, Int) -> Void

    public var items: [Model]

    private let reuseIdentifier: String
    private let configureCell: CellConfigurator

    /// Initialise the data source
    ///
    /// - Parameters:
    ///   - items: An array of `Model` items to present
    ///   - reuseIdentifier: The reuse identifier for the cell to be dequeued
    ///   - configureCell: A closure which allows displaying `Model` data inside a cell. Provides
    ///                    two arguments: a `UICollectionViewCell` and a `Model`.
    public init(items: [Model], reuseIdentifier: String, configureCell: @escaping CellConfigurator) {
        self.items = items
        self.reuseIdentifier = reuseIdentifier
        self.configureCell = configureCell
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        configureCell(cell, items[indexPath.item], indexPath.item)

        return cell
    }
}
