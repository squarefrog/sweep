//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import XCTest
import Sweep

class AccountTests: XCTestCase {
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()

    var accounts: [Account]!

    override func setUp() {
        super.setUp()
        loadAccounts()
    }

    func test_Account_CanBeDecodedFromJSON() {
        let account = accounts[0]

        XCTAssertEqual(account.id, "acc_00009237aqC8c5umZmrRdh")
        XCTAssertEqual(account.description, "Peter Pan's Account")
        let created = dateFormatter.string(from: account.created)
        XCTAssertEqual(created, "2015-11-13T12:17:42Z")
    }

    private func loadAccounts() {
        let data = JSONLoader.load(.accounts)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let response = try? decoder.decode(AccountsResponse.self, from: data)
        guard let accounts = response?.accounts else {
            fatalError("Unable to decode accounts")
        }

        self.accounts = accounts
    }

}
