//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A view model responsible for configuring how the `AccountsViewController` displays data
struct AccountsViewModel: AccountCellPresentable {
    func configure(cell: UICollectionViewCell, for account: Account, item: Int) {
        guard let cell = cell as? AccountCell else { return }
        configureLabel(in: cell, for: account)
    }

    private func configureLabel(in cell: AccountCell, for account: Account) {
        let viewModel = AccountBalanceViewModel(account: account)
        cell.balanceLabel.textColor = Theme.textColor.color
        cell.balanceLabel.attributedText = viewModel.formattedBalance()

        cell.descriptionLabel.textColor = Theme.textColor.color
        cell.descriptionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.descriptionLabel.text = account.description
    }

    func setupView(_ view: PagedCollectionView) {
        view.backgroundColor = Theme.backgroundColor.color
        registerCardCell(in: view.collectionView)
    }
}
