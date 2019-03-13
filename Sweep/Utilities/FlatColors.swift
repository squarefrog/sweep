//
//  Copyright © 2019 squarefrog. All rights reserved.
//
//  Source: https://flatuicolors.com/palette/defo

import UIKit

/// Some nice flat colors
enum FlatColor: String, CaseIterable {
    /// Darker colours
    case greenSea       = "#16a085"
    case nephritis      = "#27ae60"
    case belizeHole     = "#2980b9"
    case wisteria       = "#8e44ad"
    case midnightBlue   = "#2c3e50"
    case orange         = "#f39c12"
    case pumpkin        = "#d35400"
    case pomegranate    = "#c0392b"
    case silver         = "#bdc3c7"
    case asbestos       = "#7f8c8d"

    /// Lighter colours
    case turquoise      = "#1abc9c"
    case emerald        = "#2ecc71"
    case peterRiver     = "#3498db"
    case amethyst       = "#9b59b6"
    case wetAsphalt     = "#34495e"
    case sunFlower      = "#f1c40f"
    case carrot         = "#e67e22"
    case alizarin       = "#e74c3c"
    case clouds         = "#ecf0f1"
    case concrete       = "#95a5a6"

    /// Return a `UIColor` from a `FlatColor` case
    var color: UIColor {
        return UIColor(hexString: self.rawValue) ?? .black
    }
}
