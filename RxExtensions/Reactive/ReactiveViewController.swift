//
//  ReactiveViewController.swift
//  RxExtensions
//
//  Created by DianQK on 08/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class ReactiveViewController: UIViewController {

    open let disposeBag = DisposeBag()

    required public init(title: Observable<String>? = nil) { //TODO: add button item
        super.init(nibName: nil, bundle: nil)
        title?.bindTo(self.rx.title).addDisposableTo(disposeBag)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
