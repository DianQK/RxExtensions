//
//  Replace.swift
//  RxExtensions
//
//  Created by DianQK on 04/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {
    public func replace<T>(with value: T) -> Observable<T> {
        return map { _ in value }
    }
}
