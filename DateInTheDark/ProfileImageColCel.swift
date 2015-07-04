//
//  profileImageColCel.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/3/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit
import ZoomTransition

class ProfileImageColCel : UICollectionViewCell {
    var mainNavigationController : UINavigationController!
    var mainStoryBoard : UIStoryboard!
    var animationController : ZoomTransition?
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgProfile.setRoundedCorners()
    }
        
}