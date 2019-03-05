//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Sweep
import XCTest

class UIColorExtensionTests: XCTestCase {

    func test_UIColor_initWithHexString_ReturnsColorWithFullHexString() {
        let hex = "#ff0000"

        let color = UIColor(hexString: hex)

        XCTAssertEqual(color, UIColor(red: 1, green: 0, blue: 0, alpha: 1))
    }

    func test_UIColor_initWithHexString_ReturnsColorWithMissingOctothorpe() {
        let hex = "00ff00"

        let color = UIColor(hexString: hex)

        XCTAssertEqual(color, UIColor(red: 0, green: 1, blue: 0, alpha: 1))
    }

    func test_UIColor_initWithHexString_ReturnsNilWithIncorrectCharacterCount() {
        let hex = "00f"

        let color = UIColor(hexString: hex)

        XCTAssertNil(color)
    }

    func test_UIColor_initWithHexString_ReturnsNilWithIncorrectHexString() {
        let hex = "Bar"

        let color = UIColor(hexString: hex)

        XCTAssertNil(color)
    }

}
