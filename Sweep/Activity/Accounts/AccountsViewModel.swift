//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A view model responsible for configuring how the `AccountsViewController` displays data
struct AccountsViewModel: CardCellPresentable, ProvidesBackgroundColors {
    /// Copy the background colors so they are not reshuffled each time they are used
    private let backgroundColors = shuffledBackgroundColors

    func configure(cell: UICollectionViewCell, for account: Account, item: Int) {
        guard let cell = cell as? CardCell else { return }
        configureLabel(in: cell, for: account)
        configureBackground(in: cell, for: item)
    }

    private func configureLabel(in cell: CardCell, for account: Account) {
        cell.mainLabel.text = account.description
        cell.mainLabel.textColor = Theme.textColor.color
        cell.mainLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    private func configureBackground(in cell: CardCell, for index: Int) {
        cell.backgroundColor = backgroundColors[index].color
    }

    /// Configure view
    func setupView(_ view: PagedCollectionView) {
        view.backgroundColor = Theme.backgroundColor.color
        registerCardCell(in: view.collectionView)
    }
}
