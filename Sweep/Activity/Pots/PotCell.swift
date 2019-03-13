//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// A simple collection view cell containing a label
final class PotCell: UICollectionViewCell {
    /// The amount of rounding to apply to the corners
    private let cornerRadius: CGFloat = 5.0

    /// The main label for the cell
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel()
        layoutLabel()
        roundEdges()
        addBorder()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addLabel() {
        contentView.addSubview(mainLabel)
    }

    private func layoutLabel() {
        let constraints = [
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func roundEdges() {
        layer.cornerRadius = cornerRadius
    }

    private func addBorder() {
        layer.borderColor = UIColor(white: 1.0, alpha: 0.3).cgColor
        layer.borderWidth = 0.5
    }
}
