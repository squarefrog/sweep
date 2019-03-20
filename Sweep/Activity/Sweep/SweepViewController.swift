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
        let balance = loadBalance()
        let accounts: [Account] = loadAccounts().map {
            var account = $0
            account.update(with: balance)
            return account
        }
        accountVC.display(accounts)
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
        guard
            let label = accountsViewController.animationView as? UILabel,
            let destinationView = potsViewController.animationView,
            let endPosition = destinationView.superview?.convert(destinationView.center, to: view)
            else { return }

        let resetBalance = {
            self.accountsViewController.updateCurrentAccountBalance(0)
        }

        SweepAnimator.move(label, toPosition: endPosition, inside: view, setup: resetBalance, completion: nil)
    }

    // MARK: - Temporary Stubbed data loading

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    // swiftlint:disable force_try
    private func loadPots() -> [Pot] {
        let data = JSONLoader.load(.pots)
        let potResponse = try! decoder.decode(PotsResponse.self, from: data)
        return potResponse.pots
    }

    private func loadAccounts() -> [Account] {
        let data = JSONLoader.load(.accounts)
        let potResponse = try! decoder.decode(AccountsResponse.self, from: data)
        return potResponse.accounts
    }

    private func loadBalance() -> Balance {
        let data = JSONLoader.load(.balance)
        return try! decoder.decode(Balance.self, from: data)
    }
}
