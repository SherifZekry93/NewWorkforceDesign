//
//  UINavigationController.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 11/3/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}
