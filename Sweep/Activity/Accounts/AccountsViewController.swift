//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// Displays a list of Accounts
class AccountsViewController: UIViewController {
    private let viewModel = AccountsViewModel()
    private var dataSource: DataSource<Account>!

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
    func display(_ accounts: [Account]) {
        dataSource = DataSource<Account>(items: accounts,
                                         reuseIdentifier: viewModel.reuseIdentifier,
                                         configureCell: viewModel.configure)
    }

    func updateCurrentAccountBalance(_ balance: Int64) {
        guard let indexPath = pagedView.collectionView.indexPathForCenterItem else { return }

        var account = dataSource.items[indexPath.item]
        account.balance = balance
        dataSource.items[indexPath.item] = account

        updateCell(at: indexPath, using: account)
    }

    private func updateCell(at indexPath: IndexPath, using account: Account) {
        guard let cell = pagedView.collectionView.cellForItem(at: indexPath) else { return }

        viewModel.configure(cell: cell, for: account, item: indexPath.item)
    }
}

extension AccountsViewController: AnimationViewProvider {
    var animationView: UIView? {
        guard let cell = pagedView.visibleCell as? AccountCell else { return nil }
        return cell.balanceLabel
    }
}
