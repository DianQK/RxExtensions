//
//  ReactiveLabel.swift
//  RxExtensions
//
//  Created by DianQK on 08/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveLabel: UILabel {

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

    required public init(text: Observable<String?>? = nil) {
        super.init(frame: CGRect.zero)
        commonInit()
        text?.bindTo(self.rx.text).addDisposableTo(disposeBag)
    }

    required public init(text: Observable<NSAttributedString?>? = nil) {
        super.init(frame: CGRect.zero)
        commonInit()
        text?.bindTo(self.rx.attributedText).addDisposableTo(disposeBag)
    }

}
