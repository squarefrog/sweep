//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import XCTest
import Sweep

class PotTests: XCTestCase {

    var data: Data {
        return """
        {
          "id": "pot_0000778xxfgh4iu8z83nWb",
          "name": "Savings",
          "style": "beach_ball",
          "balance": 133700,
          "currency": "GBP",
          "created": "2017-11-09T12:30:53.695Z",
          "updated": "2017-11-09T12:30:53.695Z",
          "deleted": false
        }
        """.data(using: .utf8)!
    }

    func test_Pot_CanBeDecodedFromJSON() {
        // Given
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            // When
            let pot = try decoder.decode(Pot.self, from: data)

            // Then
            XCTAssertEqual(pot.id, "pot_0000778xxfgh4iu8z83nWb")
            XCTAssertEqual(pot.name, "Savings")
            XCTAssertEqual(pot.balance, 133700)
            XCTAssertEqual(pot.currency, "GBP")
            XCTAssertEqual(pot.deleted, false)
        } catch {
            XCTFail("Unable to decode pot \(error)")
        }
    }

}
