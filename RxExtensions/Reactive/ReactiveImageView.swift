//
//  ReactiveImageView.swift
//  RxExtensions
//
//  Created by DianQK on 04/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveImageView: UIImageView {

    public let disposeBag = DisposeBag()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override public init(image: UIImage?) {
        super.init(image: image)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    open func commonInit() {
        
    }

    required convenience public init(image: Observable<UIImage?>? = nil, tap: TapEvent? = nil) {
        self.init()
        image?.bindTo(self.rx.image).addDisposableTo(disposeBag)
        if let tap = tap {
            isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer()
            tap(tapGestureRecognizer.rx.event.map { _ in }).addDisposableTo(disposeBag)
            self.addGestureRecognizer(tapGestureRecognizer)
        }
    }

}
