//
//  Label+Rx.swift
//  Stopwatch
//
//  Created by DianQK on 10/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UILabel {
    public var textColor: AnyObserver<UIColor> {
        return UIBindingObserver(UIElement: self.base, binding: { (label, textColor) in
            label.textColor = textColor
        }).asObserver()
    }
}
