//
//  ViewBaseSW.swift
//  Stox
//
//  Created by Matan Cohen on 4/6/15.

//

import Foundation
import UIKit

class ViewBaseSW : UIView {

    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    

    init() {
        super.init(frame: CGRectZero)
        self.commonInit()
    }
    
    private func commonInit() {
        
        let name = self.ClassName
        if (NSBundle.mainBundle().pathForResource(name, ofType: "nib") != nil) {
        NSBundle.mainBundle().loadNibNamed(name, owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = .FlexibleHeight | .FlexibleWidth
        self.addSubview(contentView)
        self.viewLoaded()
        }
        
    }
    
    internal func viewLoaded() {
        
    }
    

    
}

