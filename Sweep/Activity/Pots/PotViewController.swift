//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

class PotViewController: UICollectionViewController, Storyboarded {
    private let viewModel = PotViewModel()
    private var dataSource: DataSource<Pot>!

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(dataSource != nil, "display() must be called")

        registerCells()
    }

    private func registerCells() {
        collectionView.register(viewModel.cellClass,
                                forCellWithReuseIdentifier: viewModel.reuseIdentifier)
    }

    /// Sets up a collection view data source to display pots
    /// - Note: This is a required method, and should be called before view loads
    /// - Parameter pots: The array of pots to dsplay
    func display(_ pots: [Pot]) {
        setupDataSource(with: pots)
        collectionView.dataSource = dataSource
    }

    private func setupDataSource(with pots: [Pot]) {
        dataSource = DataSource<Pot>(items: pots,
                                     reuseIdentifier: viewModel.reuseIdentifier,
                                     configureCell: viewModel.configure)
    }

}
