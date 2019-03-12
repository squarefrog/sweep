//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import XCTest
@testable import Sweep

class AccountTests: XCTestCase {
    let dateFormatter = DateFormatter.iso8601Formatter()

    var data: Data {
        return """
        {
          "id": "acc_00009237aqC8c5umZmrRdh",
          "description": "Peter Pan's Account",
          "created": "2015-11-13T12:17:42Z"
        }
        """.data(using: .utf8)!
    }

    func test_Account_CanBeDecodedFromJSON() {
        // Given
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            // When
            let account = try decoder.decode(Account.self, from: data)

            // Then
            XCTAssertEqual(account.id, "acc_00009237aqC8c5umZmrRdh")
            XCTAssertEqual(account.description, "Peter Pan's Account")
            let created = dateFormatter.string(from: account.created)
            XCTAssertEqual(created, "2015-11-13T12:17:42Z")
        } catch {
            XCTFail("Unable to decode account \(error)")
        }
    }

    func test_Account_CanBeUpdatedUsingBalanceModel() {
        // Given
        let monies = 133700
        var account = Account(id: "", description: "", created: Date(), balance: nil, currency: nil)
        let balanceModel = Balance(balance: monies, totalBalance: 100_000_000, currency: "GBP", spendToday: 0)

        // When
        account.update(with: balanceModel)

        // Then
        XCTAssertEqual(account.balance, monies)
    }

}
