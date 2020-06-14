//
//  UIColor+UI.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/14.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

extension UIColor {

   public static func hex(_ stringToConvert: String, alpha: CGFloat = 1.0) -> UIColor {
        var cstring: String = stringToConvert.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        cstring = cstring.trimmingCharacters(in: CharacterSet(charactersIn: "0X"))
        cstring = cstring.trimmingCharacters(in: CharacterSet(charactersIn: "#"))

        if cstring.count != 6 {
            return UIColor.black
        }

        let rIndex = cstring.index(cstring.startIndex, offsetBy: 0)..<cstring.index(cstring.startIndex, offsetBy: 2)
        let rString = String(cstring[rIndex])

        let gIndex = cstring.index(cstring.startIndex, offsetBy: 2)..<cstring.index(cstring.startIndex, offsetBy: 4)
        let gString = String(cstring[gIndex])

        let bIndex = cstring.index(cstring.startIndex, offsetBy: 4)..<cstring.index(cstring.endIndex, offsetBy: 0)
        let bString = String(cstring[bIndex])

        var red: UInt64 = 0
        var green: UInt64 = 0
        var blue: UInt64 = 0
        Scanner(string: rString).scanHexInt64(&red)
        Scanner(string: gString).scanHexInt64(&green)
        Scanner(string: bString).scanHexInt64(&blue)

        return UIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: alpha)
    }
    
}
