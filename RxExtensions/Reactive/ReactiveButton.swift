//
//  ReactiveButton.swift
//  RxExtensions
//
//  Created by DianQK on 08/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public typealias Tap<T> = ((Observable<T>) -> Disposable)
public typealias TapEvent = ((Observable<Void>) -> Disposable) //Tap<Void> Orz Xcode 挂掉了。。。

open class ReactiveButton: UIButton {

    public let disposeBag = DisposeBag()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {

    }

    required public init(title: Observable<String?>? = nil, isEnabled: Observable<Bool>? = nil, tap: TapEvent? = nil) {
        super.init(frame: CGRect.zero)
        commonInit()
        title?.bindTo(self.rx.title()).addDisposableTo(disposeBag)
        isEnabled?.bindTo(self.rx.isEnabled).addDisposableTo(disposeBag)
        tap?(self.rx.tap.asObservable()).addDisposableTo(disposeBag)
    }

}
