//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

extension Array {
    /// Get an item at index, wrapping the values if necessary.
    /// For example, if the array has a count of 3, and is supplied an index of 3, then the first
    /// element is returned. If an index of -1 is given, then the last element is returned.
    ///
    /// - Parameter index: The index of the item to fetch
    /// - Returns: The element at the wrapped index
    public func wrappedItem(at index: Int) -> Element {
        let wrappedIndex = (index % count + count) % count
        return self[wrappedIndex]
    }
}
