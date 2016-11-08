//
//  ReactiveTextField.swift
//  RxExtensions
//
//  Created by DianQK on 04/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveTextField: UITextField {

    public let disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {

    }

    required public init(text: Observable<String?>? = nil, textChanged: ((Observable<String?>) -> Disposable)? = nil) {
        super.init(frame: CGRect.zero)
        text?.bindTo(self.rx.text).addDisposableTo(disposeBag)
        textChanged?(self.rx.text.asObservable()).addDisposableTo(disposeBag)
    }

}
