//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// Displays a list of Pots
class PotViewController: UIViewController {
    private let viewModel = PotViewModel()
    private var dataSource: DataSource<Pot>!

    /// A reference to the custom view we use to make it easier to reference without casting
    private var pagedView: PagedCollectionView!

    /// Setup the custom view
    override func loadView() {
        assert(dataSource != nil, "display() must be called")

        let layout = PeekPagedFlowLayout()
        let pagedView = PagedCollectionView(collectionViewLayout: layout)
        pagedView.collectionView.dataSource = dataSource

        view = pagedView
        self.pagedView = pagedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupView(pagedView)
    }

    /// Sets up a collection view data source to display pots
    /// - Note: This is a required method, and should be called before view loads
    /// - Parameter pots: The array of pots to dsplay
    func display(_ pots: [Pot]) {
        dataSource = DataSource<Pot>(items: pots,
                                     reuseIdentifier: viewModel.reuseIdentifier,
                                     configureCell: viewModel.configure)
    }
}
