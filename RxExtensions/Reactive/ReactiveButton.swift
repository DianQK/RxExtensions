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

    required public init(
        title: Observable<String?>? = nil,
        images: (UIControlState, Observable<UIImage>)...,
        isEnabled: Observable<Bool>? = nil,
        tap: TapEvent? = nil) {
        super.init(frame: CGRect.zero)
        title?.bindTo(self.rx.title()).addDisposableTo(disposeBag)

        for image in images {
            image.1.bindTo(self.rx.image(for: image.0)).addDisposableTo(disposeBag)
        }

        isEnabled?.bindTo(self.rx.isEnabled).addDisposableTo(disposeBag)
        tap?(self.rx.tap.asObservable()).addDisposableTo(disposeBag)
        commonInit()
    }

}

extension Reactive where Base: UIButton {
    func image(for controlState: UIControlState = UIControlState.normal) -> UIBindingObserver<UIButton, UIImage?> {
        return UIBindingObserver(UIElement: self.base, binding: { (button, image) in
            button.setImage(image, for: controlState)
        })
    }
}
