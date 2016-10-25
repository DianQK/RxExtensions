//
//  Variable+Array.swift
//  RxExtensions
//
//  Created by DianQK on 25/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {

    public func bindTo(_ variables: [RxSwift.Variable<E>]) -> Disposable {
        // 可能存在内存泄漏
        return Disposables.create(variables.map(bindTo))
    }

}
