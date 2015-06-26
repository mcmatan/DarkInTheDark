//
//  TinderView.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 6/26/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import UIKit
import performSelector_swift
import UIColor_FlatColors
import Cartography
import ReactiveUI

class TinderView : UIViewController {

    @IBOutlet weak var barButton: UIButton!
    
    var swipeableView: ZLSwipeableView!
    
    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Belize Hole", "Amethyst", "Wisteria", "Wet Asphalt", "Midnight Blue", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Clouds", "Silver", "Concrete", "Asbestos"]
    var colorIndex = 0
    var loadCardsFromXib = false
    
    var reloadBarButtonItem = UIBarButtonItem(title: "Reload", style: .Plain) { item in }
    var leftBarButtonItem = UIBarButtonItem(title: "←", style: .Plain) { item in }
    var upBarButtonItem = UIBarButtonItem(title: "↑", style: .Plain) { item in }
    var rightBarButtonItem = UIBarButtonItem(title: "→", style: .Plain) { item in }
    var downBarButtonItem = UIBarButtonItem(title: "↓", style: .Plain) { item in }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.loadViews()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Your Menu View Controller vew must know the following data for the proper animatio
        if segue.destinationViewController .isKindOfClass(GuillotineMenuViewController.classForCoder()) {
            let destinationVC = segue.destinationViewController as! GuillotineMenuViewController
            destinationVC.hostNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
            destinationVC.hostTitleText = self.navigationItem.title
            destinationVC.view.backgroundColor = self.navigationController!.navigationBar.barTintColor
            destinationVC.setMenuButtonWithImage(barButton.imageView!.image!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Find your match"
        
        let navBar = self.navigationController!.navigationBar
        navBar.barTintColor = UIColor(red: 65.0 / 255.0, green: 62.0 / 255.0, blue: 79.0 / 255.0, alpha: 1)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        view.backgroundColor = UIColor.whiteColor()
        view.clipsToBounds = true
        
        reloadBarButtonItem.addAction() { item in
            let alertController = UIAlertController(title: nil, message: "Load Cards:", preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                // ...
            }
            alertController.addAction(cancelAction)
            
            let ProgrammaticallyAction = UIAlertAction(title: "Programmatically", style: .Default) { (action) in
                self.loadCardsFromXib = false
                self.colorIndex = 0
                self.swipeableView.discardViews()
                self.swipeableView.loadViews()
            }
            alertController.addAction(ProgrammaticallyAction)
            
            let XibAction = UIAlertAction(title: "From Xib", style: .Default) { (action) in
                self.loadCardsFromXib = true
                self.colorIndex = 0
                self.swipeableView.discardViews()
                self.swipeableView.loadViews()
            }
            alertController.addAction(XibAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        swipeableView = ZLSwipeableView()
        view.addSubview(swipeableView)
        swipeableView.didStart = {view, location in
            println("Did start swiping view at location: \(location)")
        }
        swipeableView.swiping = {view, location, translation in
            println("Swiping at view location: \(location) translation: \(translation)")
        }
        swipeableView.didEnd = {view, location in
            println("Did end swiping view at location: \(location)")
        }
        swipeableView.didSwipe = {view, direction, vector in
            println("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        swipeableView.didCancel = {view in
            println("Did cancel swiping view")
        }
        
        swipeableView.nextView = {
            if self.colorIndex < self.colors.count {
                var cardView = CardView(frame: self.swipeableView.bounds)
                cardView.backgroundColor = self.colorForName(self.colors[self.colorIndex])
                self.colorIndex++
                
                if self.loadCardsFromXib {
                    var contentView = NSBundle.mainBundle().loadNibNamed("CardContentView", owner: self, options: nil).first! as! UIView
                    contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
                    contentView.backgroundColor = cardView.backgroundColor
                    cardView.addSubview(contentView)
                    
                    // This is important:
                    // https://github.com/zhxnlai/ZLSwipeableView/issues/9
                    /*// Alternative:
                    let metrics = ["width":cardView.bounds.width, "height": cardView.bounds.height]
                    let views = ["contentView": contentView, "cardView": cardView]
                    cardView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(width)]", options: .AlignAllLeft, metrics: metrics, views: views))
                    cardView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contentView(height)]", options: .AlignAllLeft, metrics: metrics, views: views))
                    */
                    layout(contentView, cardView) { view1, view2 in
                        view1.left == view2.left
                        view1.top == view2.top
                        view1.width == cardView.bounds.width
                        view1.height == cardView.bounds.height
                    }
                }
                return cardView
            }
            return nil
        }
        
        layout(swipeableView, view) { view1, view2 in
            view1.left == view2.left+50
            view1.right == view2.right-50
            view1.top == view2.top + 120
            view1.bottom == view2.bottom - 100
        }
    }
    
    // MARK: ()
    func colorForName(name: String) -> UIColor {
        let sanitizedName = name.stringByReplacingOccurrencesOfString(" ", withString: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.swift_performSelector(Selector(selector), withObject: nil) as! UIColor
    }

}