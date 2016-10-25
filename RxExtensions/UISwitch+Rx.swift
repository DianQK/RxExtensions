//
//  UISwitch+Rx.swift
//  RxExtensions
//
//  Created by DianQK on 25/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UISwitch {
    public var isOn: ControlProperty<Bool> {
        let source = self.controlEvent(.valueChanged)
            .map { [unowned uiSwitch = self.base] in uiSwitch.isOn }
        let sink = UIBindingObserver<UISwitch, Bool>(UIElement: self.base) { uiSwitch, isOn in
            guard uiSwitch.isOn != isOn else { return }
            uiSwitch.setOn(isOn, animated: true)
        }
        return ControlProperty(values: source, valueSink: sink)
    }
}
