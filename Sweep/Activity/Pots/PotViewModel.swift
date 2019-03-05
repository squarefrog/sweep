//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A view model responsible for configuring how the `PotViewController` displays data
struct PotViewModel: CardCellPresentable, ProvidesBackgroundColors {
    private let backgroundColors = shuffledBackgroundColors

    /// Configure a cell using a pot
    func configure(cell: UICollectionViewCell, for pot: Pot, item: Int) {
        guard let cell = cell as? CardCell else { return }
        configureLabel(in: cell, for: pot)
        configureBackground(in: cell, for: item)
    }

    private func configureLabel(in cell: CardCell, for pot: Pot) {
        cell.mainLabel.text = pot.name
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
