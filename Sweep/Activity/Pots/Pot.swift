//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

public struct Pot: Decodable {
    public let id: String
    public let name: String
    public let balance: Int64
    public let currency: String
    public let deleted: Bool
}
