//
//  ReactiveBarButtonItem.swift
//  RxExtensions
//
//  Created by DianQK on 03/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift

open class ReactiveBarButtonItem: UIBarButtonItem {
    let disposeBag = DisposeBag()

    override init() {
        super.init()
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {

    }

}
