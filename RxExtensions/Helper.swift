//
//  Helper.swift
//  RxExtensions
//
//  Created by DianQK on 29/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import RxSwift

extension ObservableType {
    public func replace<T>(with value: T) -> Observable<T> {
        return asObservable().map { _ in value }
    }
}
