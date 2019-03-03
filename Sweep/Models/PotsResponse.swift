//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

/// A simple wrapper for the response returned by the `pots` endpoint
public struct PotsResponse: Decodable {
    public let pots: [Pot]
}
