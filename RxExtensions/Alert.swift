//
//  Alert.swift
//  SelectCell
//
//  Created by DianQK on 20/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift

public func showAlert(title: String?, message: String?) -> Observable<Void> {
    return Observable.create { observer in
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { _ in
            observer.on(.completed)
        }))
        alert.addAction(UIAlertAction(title: "好", style: .default, handler: { _ in
            observer.on(.next(()))
            observer.on(.completed)
        }))
        topViewController()?.showDetailViewController(alert, sender: nil)
        return Disposables.create {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
