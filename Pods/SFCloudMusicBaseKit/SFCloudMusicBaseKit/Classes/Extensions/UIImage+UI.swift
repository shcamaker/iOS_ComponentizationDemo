//
//  UIImage+UI.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/14.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

extension UIImage {
   public func toImage(contentInset: UIEdgeInsets) -> UIImage? {
        let sourceImageSize = self.size
        let width = sourceImageSize.width + contentInset.left + contentInset.right
        let height = sourceImageSize.height + contentInset.top + contentInset.bottom
        let size = CGSize(width: width, height: height)
        var resultImage: UIImage?
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        draw(at: CGPoint(x: contentInset.left, y: contentInset.top))
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }

   public func toImage(size: CGSize) -> UIImage? {
        var resultImage: UIImage?
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let sourceImageSize = self.size
        let rect = CGRect(x: (size.width - sourceImageSize.width) / 2.0,
                          y: (size.height - sourceImageSize.height) / 2.0,
                          width: sourceImageSize.width,
                          height: sourceImageSize.height)
        draw(in: rect)
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }
}
