//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

final class SweepView: UIView {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        setupStackViewConstraints()
        backgroundColor = Theme.backgroundColor.color
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addStackView() {
        addSubview(stackView)
    }

    private func setupStackViewConstraints() {
        let margins = safeAreaLayoutGuide

        let constraints = [
            stackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func addArrangedViews(_ views: [UIView]) {
        views.forEach { stackView.addArrangedSubview($0 )}
    }

}
