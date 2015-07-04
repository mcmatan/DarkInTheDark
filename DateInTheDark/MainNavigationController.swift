//
//  File.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/4/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit


class MainNavigationController {
    static var nav : UINavigationController!
    
    class func getNavigationController()->UINavigationController {
        return nav
    }
    
    class func setMainNavigationController(nav : UINavigationController) {
        MainNavigationController.nav = nav
    }
}