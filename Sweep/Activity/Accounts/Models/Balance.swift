//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Foundation

public struct Balance: Decodable {
    public let balance: Int64
    public let totalBalance: Int64
    public let currency: String
    public let spendToday: Int64
}

private extension Balance {
    private enum CodingKeys: String, CodingKey {
        case balance
        case totalBalance = "total_balance"
        case currency
        case spendToday = "spend_today"
    }
}
