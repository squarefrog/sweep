//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

extension DateFormatter {
    /// Convenience method for returning an ISO 8601 date formatter
    static func iso8601Formatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }
}
