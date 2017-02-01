//
//  ReactiveBarButtonItem.swift
//  RxExtensions
//
//  Created by DianQK on 03/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveBarButtonItem: UIBarButtonItem {

    public let disposeBag = DisposeBag()

    public override init() {
        super.init()
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {

    }

    required convenience public init(title: Observable<String>? = nil, isEnabled: Observable<Bool>? = nil, tap: TapEvent? = nil) {
        self.init()

        title?.bindTo(self.rx.title).addDisposableTo(disposeBag)
        isEnabled?.bindTo(self.rx.isEnabled).addDisposableTo(disposeBag)
        tap?(self.rx.tap.asObservable()).addDisposableTo(disposeBag)
    }

}
