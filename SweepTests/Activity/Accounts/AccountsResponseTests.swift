//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import XCTest
import Sweep

class AccountsResponsesTests: XCTestCase {

    func test_AccountsReponse_CanDecodeArrayOfAccounts() {
        // Given
        let data = JSONLoader.load(.accounts)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            // When
            let response = try decoder.decode(AccountsResponse.self, from: data)

            // Then
            XCTAssertEqual(response.accounts.count, 2)
        } catch {
            XCTFail("Account response could not be decoded: \(error)")
        }
    }

}
