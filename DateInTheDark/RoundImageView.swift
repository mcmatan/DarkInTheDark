//
//  RoundImageView.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/4/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit

class RoundImageView : UIImageView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0
    }
    override init(image: UIImage!) {
        super.init(image: image)
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0
    }
}