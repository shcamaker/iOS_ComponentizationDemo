//
//  SFDiscoverCycleScrollCell.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import SFCloudMusicFunctionKit
class SFDiscoverCycleScrollCell: SFBaseTableViewCell {
    
    
    let cycleView: SFCycleScrollView = SFCycleScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
    
    override func buildUI() {
        contentView.addSubview(cycleView)
        let images = ["dis_main_cycle1","dis_main_cycle2","dis_main_cycle3","dis_main_cycle4"]
        cycleView.imageArray = images.compactMap { [unowned self] in
            self.imagePath(imageName: $0, imageFormat: "png")
        }
        cycleView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            cycleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            cycleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            cycleView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            cycleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
       
    }
    func imagePath(imageName: String, imageFormat: String) -> UIImage{
        let bundle = Bundle(for: SFDiscoverCycleScrollCell.self)
        let fullImageName = "\(imageName)@2x.\(imageFormat)"
        guard let path  = bundle.path(forResource: fullImageName, ofType: nil, inDirectory: "SFCloudMusicDiscoverKit.bundle"), let image  = UIImage(contentsOfFile: path) else {
            return UIImage()
        }
        return image
    }
    override func bindViewModel() {
        guard let viewModel = viewModel as? SFDiscoverCycleScrollCellModel else {
            return
        }
        
    }


}
