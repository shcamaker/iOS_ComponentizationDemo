//
//  SFVideoViewController.swift
//  RXDemo
//
//  Created by 沈海超 on 2020/1/18.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

class SFVideoViewController: UIViewController, BindableType {
    
    var viewModel: SFVideoViewModel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
//        imageView.image = imagePath(imageName: "dis_main_cycle1", imageFormat: "png")
//        view.addSubview(imageView)
    }

    func imagePath(imageName: String, imageFormat: String) -> UIImage{
        let bundle = Bundle(for: SFVideoViewController.self)
        let fullImageName = "\(imageName)@2x.\(imageFormat)"
        guard let path  = bundle.path(forResource: fullImageName, ofType: nil, inDirectory: "SFCloudMusicFunctionKit.bundle"), let image  = UIImage(contentsOfFile: path) else {
            return UIImage()
        }
        return image
    }

    func bindViewModel() {
        
    }
}
