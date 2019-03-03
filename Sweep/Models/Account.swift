//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

public struct Account: Decodable {
    public let id: String
    public let description: String
    public let created: Date
}
