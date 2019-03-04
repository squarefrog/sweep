//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import Sweep
import XCTest

class DataSourceTests: XCTestCase {
    let mockCollectionView = CollectionViewPartialMock(cell: UICollectionViewCell())
    let items = ["Foo"]
    let reuseIdentifier = "Bar"

    /// The system under test
    var dataSource: DataSource<String>!

    /// Capture the arguments when data source is configuring the cell
    lazy var configure: ((UICollectionViewCell, String) -> Void) = { [unowned self] cell, model in
        self.configureCell = cell
        self.configureModel = model
    }

    var configureCell: UICollectionViewCell?
    var configureModel: String?

    override func setUp() {
        dataSource = DataSource<String>(items: items,
                                        reuseIdentifier: reuseIdentifier,
                                        configureCell: configure)
    }

    func test_DataSource_CanBeInstantiated_WithItems() {
        XCTAssertNotNil(dataSource)
    }

    func test_DataSource_ReturnsTheCorrectNumberOfItemsInSection() {
        let numberOfItems = dataSource.collectionView(mockCollectionView,
                                                      numberOfItemsInSection: 0)

        XCTAssertEqual(numberOfItems, items.count)
    }

    func test_DataSource_DequeuesReusableCellWithIdentifier() {
        let indexPath = IndexPath(item: 0, section: 0)

        _ = dataSource.collectionView(mockCollectionView, cellForItemAt: indexPath)

        XCTAssertEqual(mockCollectionView.reuseIdentifier, reuseIdentifier)
    }

    func test_DataSource_CallsConfigureCellClosure() {
        let indexPath = IndexPath(item: 0, section: 0)

        _ = dataSource.collectionView(mockCollectionView, cellForItemAt: indexPath)

        XCTAssertEqual(configureCell, mockCollectionView.cell)
        XCTAssertEqual(configureModel, items.first)
    }
}
