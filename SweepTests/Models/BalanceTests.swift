//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import XCTest
import Sweep

class BalanceTests: XCTestCase {

    /// Some people are of the opinion that each test should only have one assertion. In my opinion
    /// we are still only testing one condition, so multiple assertions are fine in this case.

    func test_Balance_CanBeDecodedFromJSON() {
        // Given
        let data = JSONLoader.load(.balance)

        do {
            // When
            let balance = try JSONDecoder().decode(Balance.self, from: data)

            // Then
            XCTAssertEqual(balance.balance, 5000)
            XCTAssertEqual(balance.totalBalance, 6000)
            XCTAssertEqual(balance.currency, "GBP")
            XCTAssertEqual(balance.spendToday, 0)
        } catch {
            XCTFail("Balance could not be decoded: \(error)")
        }
    }

}
