//
//  UIButton+Rx.swift
//  RxExtensions
//
//  Created by DianQK on 25/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {
    public var select: ControlProperty<Bool> {
        let source = tap.map { [unowned button = self.base] _ -> Bool in
            button.isSelected = button.isSelected.reverseValue
            return button.isSelected
        }
        let sink = isSelected
        return ControlProperty(values: source, valueSink: sink)
    }
}
