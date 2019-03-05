//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

protocol ProvidesBackgroundColors {
    static var shuffledBackgroundColors: [FlatColor] { get }
}

extension ProvidesBackgroundColors {
    /// An array of shuffled background colours
    static var shuffledBackgroundColors: [FlatColor] {
        return Theme.availableBackgroundColors.shuffled()
    }
}
