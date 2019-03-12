//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

protocol CellPresentable {
    var reuseIdentifier: String { get }

    func registerCardCell(in collectionView: UICollectionView)
}
