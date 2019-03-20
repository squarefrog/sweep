//
//  Copyright © 2019 squarefrog. All rights reserved.
//

import UIKit

/// PagedCollectonView a simple view containing a collection view that spans the full width and
/// height of the view. Additionally there is a hidden paging scroll view above the collection view
/// which allows easier paging of collection view cells.
///
/// It is intended to be used as a view controllers main view, and should be used in conjunction
/// with a flow layout that presents a single cell at at time.
class PagedCollectionView: UIView {
    let collectionView: UICollectionView

    /// Create a dummy scroll view to make paging the collection view easier
    private lazy var pagingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isHidden = true
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    /// Keep collection view background colour in sync with view background color
    override var backgroundColor: UIColor? {
        didSet { collectionView.backgroundColor = backgroundColor }
    }

    /// Returns the current 'page' in the collection view
    var visibleCell: UICollectionViewCell? {
        guard let indexPath = collectionView.indexPathForCenterItem else { return nil }

        return collectionView.cellForItem(at: indexPath)
    }

    /// Keep a reference to the paging scroll view's left and right constraints, as they will need
    /// to be updated whenever the view is laid out
    private var scrollViewLeftConstraint: NSLayoutConstraint!
    private var scrollViewRightConstraint: NSLayoutConstraint!

    /// Initialise the view
    ///
    /// - Parameter collectionViewLayout: The layout to use while instantiating the collection view
    init(collectionViewLayout: UICollectionViewLayout) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: .zero)

        addSubviews()
        activateConstraints()
        setupPagingPanGestureRecognizer()
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [collectionView, pagingScrollView].forEach(addSubview)
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate(scrollViewConstraints() + collectionViewConstraints())
    }

    private func scrollViewConstraints() -> [NSLayoutConstraint] {
        // Keep a reference to the left and right edge constraints for use later
        scrollViewLeftConstraint = pagingScrollView.leftAnchor.constraint(equalTo: leftAnchor)
        scrollViewRightConstraint = pagingScrollView.rightAnchor.constraint(equalTo: rightAnchor)

        return [ scrollViewLeftConstraint,
                 scrollViewRightConstraint,
                 pagingScrollView.topAnchor.constraint(equalTo: topAnchor),
                 pagingScrollView.bottomAnchor.constraint(equalTo: bottomAnchor) ]
    }

    private func collectionViewConstraints() -> [NSLayoutConstraint] {
        return [ collectionView.topAnchor.constraint(equalTo: topAnchor),
                 collectionView.leftAnchor.constraint(equalTo: leftAnchor),
                 collectionView.rightAnchor.constraint(equalTo: rightAnchor),
                 collectionView.bottomAnchor.constraint(equalTo: bottomAnchor) ]
    }

    /// In order to gain the benefit of the paged scroll view, we must make the collection view use
    /// the paged scroll view's pan gesture recognizer, and disable the collection views own pan
    /// gesture recogniser
    private func setupPagingPanGestureRecognizer() {
        collectionView.addGestureRecognizer(pagingScrollView.panGestureRecognizer)
        collectionView.panGestureRecognizer.isEnabled = false
    }

    /// When laying out subviews, update the paging scroll view's content size and constraints
    override func layoutSubviews() {
        super.layoutSubviews()

        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        // Ensure the paging scroll view has the same content size as the collection view
        pagingScrollView.contentSize = layout.collectionViewContentSize

        // Offset the scroll view by the layouts left section inset
        scrollViewLeftConstraint.constant = layout.sectionInset.left

        // Make the scroll view the same width and offset of a cell plus its spacing
        scrollViewRightConstraint.constant = -layout.minimumLineSpacing
    }
}

extension PagedCollectionView: UIScrollViewDelegate {
    /// As the scroll view scrolls, update the collection view's content offset
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == pagingScrollView else { return }
        collectionView.contentOffset = scrollView.contentOffset
    }
}
