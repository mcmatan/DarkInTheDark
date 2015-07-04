//
//  PlistLoader.swift
//  DateInTheDark
//
//  Created by Matan Cohen on 7/4/15.
//  Copyright (c) 2015 Matan Cohen. All rights reserved.
//

import Foundation

class PlistLoader {
    class func loadPlistAsDictionary(name : String)->Dictionary<String, String> {
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict as? Dictionary<String, String> {

            return dict
        }
        NSException(name: "No Plist for this name", reason: "No Plist for this name", userInfo: nil)
        return Dictionary()
    }
    class func loadPlistAsArray(name : String)->Array<String> {
        var myDict: NSArray?
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist") {
            myDict = NSArray(contentsOfFile: path)
        }
        if let array = myDict as? Array<String> {
            
            return array
        }
        NSException(name: "No Plist for this name", reason: "No Plist for this name", userInfo: nil)
        return Array()
    }
    class func loadPlistAsArrayOfDictionarys(name : String)->Array<Dictionary<String, String>> {
        var myDict: NSArray?
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist") {
            myDict = NSArray(contentsOfFile: path)
        }
        if let array = myDict as? Array<Dictionary<String, String>> {
            
            return array
        }
        NSException(name: "No Plist for this name", reason: "No Plist for this name", userInfo: nil)
        return Array()
    }

}