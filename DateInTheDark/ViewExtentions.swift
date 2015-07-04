//
//  ViewExtentions.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/4/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setRoundedCorners() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0
    }
    func setDeafultRoundedCorners() {
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0
    }
   }