//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Sweep
import XCTest

class ArrayExtensionTests: XCTestCase {

    let array = [0, 1, 2]

    func test_Array_WrappedItemAtIndex_WrapsForward() {
        let element = array.wrappedItem(at: array.count)

        XCTAssertEqual(element, array.first)
    }

    func test_Array_WrappedItemAtIndex_WrapsBackward() {
        let element = array.wrappedItem(at: -1)

        XCTAssertEqual(element, array.last)
    }
}
