//
//  OpeningImageView.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/4/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit

class OpeningImageView  : UIImageView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    override init(image: UIImage!) {
        super.init(image: image)
        self.setup()
    }
    
    func setup() {
        self.userInteractionEnabled = true
        var tapBackgorundImage = UITapGestureRecognizer(target: self, action: "didTap")
        self.addGestureRecognizer(tapBackgorundImage)
    }
    
    func didTap() {
        let imageViewController = ImageViewController(nibName: "ImageViewController", bundle: nil)
        imageViewController.imageToDisplay = self.image
        MainNavigationController.getNavigationController().pushViewController(imageViewController, animated: true)
    }

}