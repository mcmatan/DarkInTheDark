//
//  ProfileView.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 6/27/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation
import UIKit

class ProfileView : UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var topImageColectionView: UICollectionView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
    
        MainNavigationController.setMainNavigationController(self.navigationController!)
        self.topImageColectionView.pagingEnabled = true
        self.automaticallyAdjustsScrollViewInsets = false
        var itemWidth = UIScreen.mainScreen().bounds.width
        var itemHeight = CGRectGetHeight(self.topImageColectionView.frame)
        
        var layout = self.topImageColectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(itemWidth, layout.itemSize.height)
        
        self.title = "Your name"
    }
    
    
    //MARK: Date source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell : ProfileImageColCel = collectionView.dequeueReusableCellWithReuseIdentifier("ProfileImageColCel", forIndexPath: indexPath) as! ProfileImageColCel
        var dataSource = PlistLoader.loadPlistAsArrayOfDictionarys("ProfileViewMocData")[indexPath.row]

        cell.imgProfile.image = UIImage(named: dataSource["ProfileImage"]!)
        cell.imgProfile.addRoundedOffsetToRoundImage(cell.lblTitle.textColor)
        cell.imgBackground.image = UIImage(named: dataSource["BackgroundImage"]!)
        cell.imgBackground.clipsToBounds = true
        cell.lblContent.text = "\"" + dataSource["Content"]! + "\""
        cell.lblSubtitle.text = dataSource["LastName"]
        cell.lblTitle.text = dataSource["UserName"]
        cell.mainNavigationController = self.navigationController
        cell.mainStoryBoard = self.storyboard
        
        return cell
    }
    
//    optional func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        
//    }
//    
//    optional func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> {
//        
//    }
}