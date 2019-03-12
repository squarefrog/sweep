//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

extension Locale {
    /// Instantiate a Locale using an ISO 4217 currecy identifier
    ///
    /// - Parameter currencyCode: The currency identifier, e.g. "GBP", "USD"
    init?(currencyCode: String) {
        let components: [String: String] = [NSLocale.Key.currencyCode.rawValue: currencyCode]
        let identifier = Locale.identifier(fromComponents: components)
        self.init(identifier: identifier)
    }
}
