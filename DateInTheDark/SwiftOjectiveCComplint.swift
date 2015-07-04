//
//  SwiftOjectiveCComplint.swift
//  Stox
//
//  Created by Matan Cohen on 4/6/15.

//

import Foundation
import UIKit

extension NSObject {
    var ClassName: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
    
}

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}
