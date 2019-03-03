//
//  JSONLoader.swift
//  Sweep
//
//  Created by Paul Williamson on 03/03/2019.
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

/// A helper utility to load stubbed JSON from the bundle
public struct JSONLoader {

    /// A list of files available to load
    public enum File: String {
        case balance
        case accounts
    }

    /// Load a stubbed JSON response from the main bundle
    ///
    /// - Parameter file: The file to load
    /// - Returns: Data representation of the JSON response
    public static func load(_ file: File) -> Data {
        let path = Bundle.main.path(forResource: file.rawValue, ofType: "json")!
        let url = URL(fileURLWithPath: path)

        // I wouldn't normally force try loading data, but this is going to be used during
        // development only, and I want the app to crash if data cannot be loaded

        // swiftlint:disable:next force_try
        return try! Data(contentsOf: url)
    }
}
