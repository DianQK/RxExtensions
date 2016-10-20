//
//  Transition.swift
//  SelectCell
//
//  Created by DianQK on 20/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

public func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
	   if let nav = base as? UINavigationController {
	       return topViewController(nav.visibleViewController)
	   }
	   if let tab = base as? UITabBarController {
	       if let selected = tab.selectedViewController {
	           return topViewController(selected)
	       }
	   }
	   if let presented = base?.presentedViewController {
	       return topViewController(presented)
	   }
	   return base
}

public let pop: () -> () = {
    topViewController()?.navigationController?.popViewController(animated: true).ignore()
}

public let show: (UIViewController) -> () = { vc in
    topViewController()?.show(vc, sender: nil)
}

public let showDetailViewController: (UIViewController) -> () = { vc in
    topViewController()?.showDetailViewController(vc, sender: nil)
}

public let push: (UIViewController) -> () = { vc in
    topViewController()?.navigationController?.pushViewController(vc, animated: true)
}

public let present: (UIViewController) -> () = { vc in
    topViewController()?.present(vc, animated: true, completion: nil)
}
