//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

class PotViewController: UICollectionViewController, Storyboarded {
    private let viewModel = PotViewModel()
    private var dataSource: DataSource<Pot>!

    /// Create a dummy scroll view to make paging the collection view easier
    private lazy var pagingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isHidden = true
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    /// Keep a reference to the paging scroll view's left and right constraints, as they will need
    /// to be updated whenever the view is laid out
    private var scrollViewLeftConstraint: NSLayoutConstraint!
    private var scrollViewRightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(dataSource != nil, "display() must be called")

        registerCells()
        addPagingScrollView()
        layoutPagingScrollView()
        setupPagingPanGestureRecognizer()
    }

    /// Sets up a collection view data source to display pots
    /// - Note: This is a required method, and should be called before view loads
    /// - Parameter pots: The array of pots to dsplay
    func display(_ pots: [Pot]) {
        setupDataSource(with: pots)
        collectionView.dataSource = dataSource
    }

    private func setupDataSource(with pots: [Pot]) {
        dataSource = DataSource<Pot>(items: pots,
                                     reuseIdentifier: viewModel.reuseIdentifier,
                                     configureCell: viewModel.configure)
    }

    private func registerCells() {
        collectionView.register(viewModel.cellClass, forCellWithReuseIdentifier: viewModel.reuseIdentifier)
    }

    /// After the layout has been prepared, update the scroll views content size and constraints
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard let layout = collectionViewLayout as? PeekPagedFlowLayout else { return }

        pagingScrollView.contentSize = layout.collectionViewContentSize

        // Make the scroll view the same width and offset of a cell plus its spacing
        scrollViewLeftConstraint.constant = layout.sectionInset.left
        scrollViewRightConstraint.constant = -layout.spacing
    }

    private func addPagingScrollView() {
        view.addSubview(pagingScrollView)
    }

    private func layoutPagingScrollView() {
        // Save a reference to the left and right edge constraints for use later
        scrollViewLeftConstraint = pagingScrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        scrollViewRightConstraint = pagingScrollView.rightAnchor.constraint(equalTo: view.rightAnchor)

        let constraints: [NSLayoutConstraint] = [
            scrollViewLeftConstraint,
            scrollViewRightConstraint,
            pagingScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            pagingScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    /// In order to gain the benefit of the paged scroll view, we must tell collection view to use
    /// the paged scroll view's pan gesture recognizer
    private func setupPagingPanGestureRecognizer() {
        collectionView.addGestureRecognizer(pagingScrollView.panGestureRecognizer)
        collectionView.panGestureRecognizer.isEnabled = false
    }

    /// As the scroll view scrolls, update the collection view's content offset
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == pagingScrollView else { return }
        collectionView.contentOffset = scrollView.contentOffset
    }
}
