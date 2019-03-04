//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

struct PotViewModel {
    var reuseIdentifier: String {
        return CardCell.reuseIdentifier
    }

    let cellClass = CardCell.self

    /// Configure a cell using a pot
    func configure(cell: UICollectionViewCell, for pot: Pot) {
        guard let cell = cell as? CardCell else { return }
        configureLabel(in: cell, for: pot)
        configureBackground(in: cell, for: pot)
    }

    private func configureLabel(in cell: CardCell, for pot: Pot) {
        cell.mainLabel.text = pot.name
        cell.mainLabel.textColor = .white
        cell.mainLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    private func configureBackground(in cell: CardCell, for pot: Pot) {
        cell.backgroundColor = .orange
    }
}
