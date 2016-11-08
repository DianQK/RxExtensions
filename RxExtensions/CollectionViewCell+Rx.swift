//
//  CollectionViewCell+Rx.swift
//  RxExtensions
//
//  Created by DianQK on 03/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveCollectionViewCell: UICollectionViewCell {

    public private(set) var prepareForReuseBag = DisposeBag()

    public let disposeBag = DisposeBag()

    open override func prepareForReuse() {
        super.prepareForReuse()
        prepareForReuseBag = DisposeBag()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    open func commonInit() {

    }
}

extension Reactive where Base: UICollectionViewCell {
    public var prepareForReuse: Observable<Void> {
        return Observable.of(sentMessage(#selector(UICollectionViewCell.prepareForReuse)).map { _ in }, deallocated).merge()
    }

    public var prepareForReuseBag: DisposeBag {
        return base._rx_prepareForReuseBag
    }
}

private struct AssociatedKeys {
    static var _disposeBag: Void = ()
}

extension UICollectionViewCell {

    fileprivate var _rx_prepareForReuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()

        if let bag = objc_getAssociatedObject(self, &AssociatedKeys._disposeBag) as? DisposeBag {
            return bag
        }

        let bag = DisposeBag()
        objc_setAssociatedObject(self, &AssociatedKeys._disposeBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        _ = rx.prepareForReuse
            .takeUntil(rx.deallocated)
            .subscribe(onNext: { [weak self] _ in
                let newBag = DisposeBag()
                objc_setAssociatedObject(self, &AssociatedKeys._disposeBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            })
        
        return bag
    }
}



