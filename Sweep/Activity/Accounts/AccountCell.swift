//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

final class AccountCell: UICollectionViewCell {
    let balanceLabel = UILabel()
    let descriptionLabel = UILabel()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        layoutStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(stackView)

        for label in [balanceLabel, descriptionLabel] {
            stackView.addArrangedSubview(label)
        }
    }

    private func layoutStackView() {
        let left = stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        left.priority = .defaultHigh

        let right = stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        right.priority = .defaultHigh

        let constraints = [
            left,
            right,
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
