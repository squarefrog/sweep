//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

/// Defines the colours used in the app
struct Theme {

    /// The main background color
    static var backgroundColor = FlatColor.midnightBlue

    /// The main text color
    static var textColor = FlatColor.clouds

    /// An array of available colours for cell backgrounds
    static var availableBackgroundColors: [FlatColor] {
        return FlatColor.allCases.filter {
            !reservedColors.contains($0)
        }
    }

    /// Some colours are too close to the background and text colour, so we will mark them as reseved
    private static var reservedColors: [FlatColor] {
        return [
            backgroundColor,
            textColor,
            .silver,
            .wetAsphalt
        ]
    }
}
