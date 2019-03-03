//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import XCTest
import Sweep

class PotsResponsesTests: XCTestCase {

    func test_PotsReponse_CanDecodeArrayOfPots() {
        // Given
        let data = JSONLoader.load(.pots)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            // When
            let response = try decoder.decode(PotsResponse.self, from: data)

            // Then
            XCTAssertEqual(response.pots.count, 3)
        } catch {
            XCTFail("Account response could not be decoded: \(error)")
        }
    }

}
