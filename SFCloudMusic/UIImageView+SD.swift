//
//  UIImageView+SD.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/14.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func SFSetImage(withPath imagePath: String)  {
        guard let placeholder = UIImage(systemName: "exclamationmark.triangle.fill") else {
            return
        }
        SFSetImage(withPath: imagePath, placeholderImage: placeholder)
    }
    func SFSetImage(withPath imagePath: String, placeholderImage placeholder: UIImage)  {
        SFSetImage(withPath: imagePath, placeholderImage: placeholder, completed: nil)
    }
    func SFSetImage(withPath imagePath: String, placeholderImage placeholder: UIImage, completed: SDExternalCompletionBlock?)  {
        guard let url = URL(string: imagePath) else {
            self.image = placeholder
            return
        }
        sd_setImage(with: url, placeholderImage: placeholder, completed: completed)
    }
    
}
