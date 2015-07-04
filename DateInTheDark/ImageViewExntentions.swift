//
//  ImageViewExntentions.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/4/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func setWhiteBorder() {
        self.layer.borderWidth = 3;
        self.layer.borderColor = UIColor.whiteColor().CGColor
    }
    func addRoundedOffsetToRoundImage() {
        self.addRoundedOffsetToRoundImage(UIColor.blueColor())
    }
    func addRoundedOffsetToRoundImage(color : UIColor) {
        var roundView = UIView(frame: self.frame)
        roundView.layer.borderColor = color.CGColor
        roundView.layer.borderWidth = 6.0
        roundView.backgroundColor = UIColor.clearColor()
        self.superview?.insertSubview(roundView, belowSubview: self)
        roundView.frame = CGRectMake(self.frame.origin.x - 10, self.frame.origin.y - 2.5, self.frame.size.width + 5, self.frame.size.height + 5)
        roundView.layer.cornerRadius = self.frame.size.width/2
        roundView.layer.masksToBounds = true
        roundView.clipsToBounds = false

    }
}