//
//  NSObject+Rx.swift
//  Stopwatch
//
//  Created by DianQK on 10/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectiveC

extension Reactive where Base: NSObject {
    public var disposeBag: DisposeBag {
        return base._rx_disposeBag
    }
}

private struct AssociatedKeys {
    static var _disposeBag: Void = ()
}

extension NSObject {

    fileprivate var _rx_disposeBag: DisposeBag {
        get {
            objc_sync_enter(self); defer { objc_sync_exit(self) }
            var disposeBag: DisposeBag
            let lookup = objc_getAssociatedObject(self, &AssociatedKeys._disposeBag) as? DisposeBag
            if let lookup = lookup {
                disposeBag = lookup
            } else {
                let newDisposeBag = DisposeBag()
                self._rx_disposeBag = newDisposeBag
                disposeBag = newDisposeBag
            }
            return disposeBag
        }
        
        set {
            objc_sync_enter(self); defer { objc_sync_exit(self) }
            objc_setAssociatedObject(self, &AssociatedKeys._disposeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
