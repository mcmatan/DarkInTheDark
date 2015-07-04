//
//  CardView.swift
//  ZLSwipeableViewSwiftDemo
//
//  Created by Zhixuan Lai on 5/24/15.
//  Copyright (c) 2015 Zhixuan Lai. All rights reserved.
//

import UIKit
import SnapKit

class CardView: ViewBaseSW {
    var image : UIImageView!
    var mainNavigationController : UINavigationController!
    var mainStoryBoard : UIStoryboard!
    
    override func viewLoaded() {
        super.viewLoaded()
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.33
        layer.shadowOffset = CGSizeMake(0, 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.mainScreen().scale
        
        // Corner Radius
        layer.cornerRadius = 10.0;
        
        self.contentView.clipsToBounds = true
        
        var tap = UITapGestureRecognizer(target: self, action: "didTap")
        self.addGestureRecognizer(tap)
        }
    
    
    func didTap() {
        if let nav = self.mainNavigationController {
            if let isStoryboard = self.mainStoryBoard {
                var profileView : ProfileView = isStoryboard.instantiateViewControllerWithIdentifier("ProfileView") as! ProfileView
                self.mainNavigationController .pushViewController(profileView, animated: true)
            }
        } else {
            NSException(name: "No navigation controller", reason: "No navigation controller", userInfo: nil).raise()
        }
    }
}
