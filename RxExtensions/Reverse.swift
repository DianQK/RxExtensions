//
//  Reverse.swift
//  SelectCell
//
//  Created by DianQK on 20/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol Reverseable {
    var reverseValue: Self { get }
}

extension Bool: Reverseable {
    public var reverseValue: Bool {
        return !self
    }
}

extension Variable where Element: Reverseable {
    /// 设置相反的值
    public func reversed() {
        value = value.reverseValue
    }
}

extension ObservableType where E: Reverseable {
    public func reverse() -> Observable<E> {
        return asObservable().map { $0.reverseValue }
    }
}
