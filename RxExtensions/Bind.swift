//
//  Bind.swift
//  Stopwatch
//
//  Created by 宋宋 on 10/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    public func bindTo<O : ObserverType>(_ observer: O?) -> Disposable? where O.E == E {
        guard let observer = observer else {
            return nil
        }
        let disposable: Disposable = bindTo(observer)
        return disposable
    }
    
    public func bindTo(_ variable: RxSwift.Variable<E>?) -> Disposable? {
        guard let variable = variable else {
            return nil
        }
        let disposable: Disposable = bindTo(variable)
        return disposable
    }
    
    public func bindTo<O : ObserverType>(_ observer: O) -> Disposable where O.E == Optional<E> {
        return map(Optional.init).bindTo(observer)
    }
    
    public func bindTo(_ variable: RxSwift.Variable<Optional<E>>) -> Disposable {
        return map(Optional.init).bindTo(variable)
    }
    
    public func bindTo<O : ObserverType>(_ observer: O?) -> Disposable? where O.E == Optional<E> {
        guard let observer = observer else {
            return nil
        }
        let disposable: Disposable = map(Optional.init).bindTo(observer)
        return disposable
    }
    
    public func bindTo(_ variable: RxSwift.Variable<Optional<E>>?) -> Disposable? {
        guard let variable = variable else {
            return nil
        }
        let disposable: Disposable = map(Optional.init).bindTo(variable)
        return disposable
    }
    

    
    
//    public func bindTo<O : ObserverType where O.E == E>(_ observer: O) -> Disposable
//    
//    public func bindTo(_ variable: RxSwift.Variable<Self.E>) -> Disposable
//    
//    public func bindTo<R>(_ binder: (Self) -> R) -> R
//    
//    public func bindTo<R1, R2>(_ binder: (Self) -> @escaping (R1) -> R2, curriedArgument: R1) -> R2
//    
//    public func bindNext(_ onNext: @escaping (Self.E) -> Swift.Void) -> Disposable
}
