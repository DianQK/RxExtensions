//
//  UIBarItem+Rx.swift
//  RxExtensions
//
//  Created by DianQK on 03/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIBarItem {
    public var title: UIBindingObserver<UIBarItem, String?> {
        return UIBindingObserver(UIElement: self.base, binding: { (barItem, title) in
            barItem.title = title
        })
    }
}
