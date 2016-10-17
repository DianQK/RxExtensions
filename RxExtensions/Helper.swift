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

extension Observable {
    public static func combineLatest<O: ObservableType>(array: [O]) -> Observable<[O.E]> {
//        return Observable.combineLatest(<#T##source1: O1##O1#>, <#T##source2: O2##O2#>, resultSelector: <#T##(O1.E, O2.E) throws -> Element#>)
        guard let first = array.first else {
            return Observable.empty()
        }
        if array.count == 2 {
            return Observable.combineLatest(array[0], array[1], resultSelector: <#T##(O1.E, O2.E) throws -> Element#>)
        }
    }
}
