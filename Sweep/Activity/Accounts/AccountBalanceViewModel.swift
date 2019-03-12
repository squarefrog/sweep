//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

struct AccountBalanceViewModel {
    private let account: Account
    private let numberFormatter: NumberFormatter

    init(account: Account) {
        self.account = account

        let formatter = NumberFormatter()

        if let currencyCode = account.currency {
            formatter.numberStyle = .currency
            formatter.locale = Locale(currencyCode: currencyCode)
        }

        self.numberFormatter = formatter
    }

    private var mainAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 48, weight: .light)
    ]

    private var alternativeAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 18, weight: .light)
    ]

    private var emptyDataString: NSAttributedString {
        return NSAttributedString(string: "---")
    }

    /// Returns the account balance, pretty formatted as an NSAttributedString
    func formattedBalance() -> NSAttributedString {
        guard let balance = account.balance else { return emptyDataString }
        let balanceDecimal = Double(balance) / 100.0

        guard var balanceString = numberFormatter.string(from: balanceDecimal as NSNumber) else {
            return emptyDataString
        }

        // Remove non-breaking linespace
        balanceString = balanceString.replacingOccurrences(of: " ", with: "")

        let attrStr = NSMutableAttributedString(string: balanceString, attributes: mainAttributes)
        let nsString = (balanceString as NSString)

        let currencySymbolRange = nsString.range(of: numberFormatter.currencySymbol)
        attrStr.addAttributes(alternativeAttributes, range: currencySymbolRange)

        let unitsRange = nsString.range(of: minorUnits(in: balanceString))
        attrStr.addAttributes(alternativeAttributes, range: unitsRange)

        return attrStr
    }

    private func minorUnits(in balance: String) -> String {
        guard let range = balance.range(of: numberFormatter.currencyDecimalSeparator) else { return "" }
        return String(balance[range.lowerBound...])
    }
}
