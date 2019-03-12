//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// The main app view controller
final class SweepViewController: UIViewController {
    var sweepView: SweepView!

    var accountsViewController: AccountsViewController!
    var potsViewController: PotViewController!

    override func loadView() {
        let view = SweepView()
        self.view = view
        sweepView = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        accountsViewController = createAccountViewController()
        potsViewController = createPotsViewController()

        let controllers: [UIViewController] = [accountsViewController, potsViewController]

        controllers.forEach { addChild($0) }
        sweepView.addArrangedViews([
            accountsViewController.view,
            potsViewController.view,
            createSweepButton()
            ])
        controllers.forEach { $0.didMove(toParent: self) }
    }

    private func createAccountViewController() -> AccountsViewController {
        let accountVC = AccountsViewController()
        accountVC.display(loadAccounts())
        return accountVC
    }

    private func createPotsViewController() -> PotViewController {
        let potVC = PotViewController()
        potVC.display(loadPots())
        return potVC
    }

    private func createSweepButton() -> UIButton {
        let btn = UIButton()
        let broom = "🧹"
        btn.setTitle(broom, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 100)
        btn.addTarget(self, action: #selector(sweep), for: .touchUpInside)
        return btn
    }

    @objc private func sweep() {
        print("SVEEEEEEEEEEEEEP!")
    }

    private func loadPots() -> [Pot] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let data = JSONLoader.load(.pots)
        // swiftlint:disable force_try
        let potResponse = try! decoder.decode(PotsResponse.self, from: data)
        return potResponse.pots
    }

    private func loadAccounts() -> [Account] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let data = JSONLoader.load(.accounts)
        // swiftlint:disable force_try
        let potResponse = try! decoder.decode(AccountsResponse.self, from: data)
        return potResponse.accounts
    }
}
