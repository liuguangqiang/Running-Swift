//
//  UIColor+Extension.swift
//  running
//
//  Created by 刘光强 on 2017/9/13.
//  Copyright © 2017年 guangqiang. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor{
    
    public class func primary() -> UIColor{
        return UIColor(rgba: "#00b96b")
    }
    
    public class func window() -> UIColor{
        return UIColor(rgba: "#f5f5f5")
    }
    
    public class func divider() -> UIColor{
        return UIColor(rgba: "#cdcdcd")
    }
    
    public class func grayDark() -> UIColor{
        return UIColor(rgba: "#333333")
    }
    
    public class func grayMiddle() -> UIColor{
        return UIColor(rgba: "#666666")
    }
    
    public class func grayLight() -> UIColor{
        return UIColor(rgba: "#aaaaaa")
    }
    
    public convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let index   =  rgba.characters.index(rgba.startIndex, offsetBy: 1)
            let hex  : String   = rgba.substring(from: index)
            let length : Int = hex.characters.count
            
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                switch (length) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    alpha   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    red = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    green  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    blue = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                print("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    
}
