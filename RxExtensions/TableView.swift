//
//  TableView.swift
//  RxExtensions
//
//  Created by DianQK on 30/09/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxCocoa

protocol AutoDeselect {
}

extension UITableView: AutoDeSelect {
    func autoDeselect() {
        rx.itemSelected
            .map { (at: $0, animted: true) }
            .subscribe(onNext: deselectRow)
        deselectRow(at: <#T##IndexPath#>, animated: <#T##Bool#>)
    }
}
