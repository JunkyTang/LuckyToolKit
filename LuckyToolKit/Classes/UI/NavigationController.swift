//
//  NavigationController.swift
//  LuckyUI
//
//  Created by junky on 2024/2/23.
//

import UIKit

open class NavigationController: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }


    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
            if let vc = viewController as? ViewController {
                vc.navigationBar.backBtn.isHidden = false
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    

}
