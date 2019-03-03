//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

/// A simple wrapper for the response returned by the `accounts` endpoint
public struct AccountsResponse: Decodable {
    public let accounts: [Account]
}
