//
//  UITableViewHeaderFooterView+Rx.swift
//  RxExtensions
//
//  Created by DianQK on 25/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveTableViewHeaderFooterView: UITableViewHeaderFooterView {
    public private(set) var prepareForReuseBag = DisposeBag()

    open override func prepareForReuse() {
        super.prepareForReuse()
        prepareForReuseBag = DisposeBag()
    }
}

extension Reactive where Base: UITableViewHeaderFooterView {
    public var prepareForReuse: Observable<Void> {
        return Observable.of(sentMessage(#selector(UITableViewHeaderFooterView.prepareForReuse)).map { _ in }, deallocated).merge()
    }

    public var prepareForReuseBag: DisposeBag {
        return base._rx_prepareForReuseBag
    }
}

private struct AssociatedKeys {
    static var _disposeBag: Void = ()
}

extension UITableViewHeaderFooterView {

    fileprivate var _rx_prepareForReuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()

        if let bag = objc_getAssociatedObject(self, &AssociatedKeys._disposeBag) as? DisposeBag {
            return bag
        }

        let bag = DisposeBag()
        objc_setAssociatedObject(self, &AssociatedKeys._disposeBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        _ = rx.prepareForReuse
            .takeUntil(rx.deallocated)
            .subscribe(onNext: { [weak self] in
                let newBag = DisposeBag()
                objc_setAssociatedObject(self, &AssociatedKeys._disposeBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
                })
        
        return bag
    }
}

