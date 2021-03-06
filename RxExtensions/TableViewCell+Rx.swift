//
//  Cell+Rx.swift
//  Expandable
//
//  Created by DianQK on 8/17/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveTableViewCell: UITableViewCell {

    public private(set) var prepareForReuseBag = DisposeBag()

    public let disposeBag = DisposeBag()

    open override func prepareForReuse() {
        super.prepareForReuse()
        prepareForReuseBag = DisposeBag()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

extension Reactive where Base: UITableViewCell {
    public var prepareForReuse: Observable<Void> {
        return Observable.of(sentMessage(#selector(UITableViewCell.prepareForReuse)).map { _ in }, deallocated).merge()
    }
    
    public var prepareForReuseBag: DisposeBag {
        return base._rx_prepareForReuseBag
    }
}

private struct AssociatedKeys {
    static var _disposeBag: Void = ()
}

extension UITableViewCell {

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



