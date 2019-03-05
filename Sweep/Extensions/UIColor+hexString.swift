//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

extension UIColor {
    /// Initialise a `UIColor` from a hex string
    /// - Note: It doesn't matter if the hex string has a `#` prefix.
    /// - Parameter hexString: A 6 digit, 24-bit hex string, e.g. `#ff0000`, `#d7d7cb` etc.
    public convenience init?(hexString: String) {
        let cleaned = hexString.replacingOccurrences(of: "#", with: "")

        guard cleaned.count == 6 else { return nil }

        let red, green, blue: CGFloat
        let scanner = Scanner(string: cleaned)
        var hex: UInt64 = 0

        guard scanner.scanHexInt64(&hex) else { return nil }

        red   = CGFloat((hex & 0xff0000) >> 16) / 255
        green = CGFloat((hex & 0x00ff00) >> 8) / 255
        blue  = CGFloat((hex & 0x0000ff) >> 0) / 255

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
