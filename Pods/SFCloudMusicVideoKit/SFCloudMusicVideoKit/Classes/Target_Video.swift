//
//  Target_Video.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

@objc class Target_Video: NSObject {
    @objc func Action_videoViewController(_ params: NSDictionary) -> UIViewController? {
        let bundle = Bundle(for: Target_Video.self)
        let storyboard = UIStoryboard(name: "Video", bundle: bundle)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SFVideoViewController") as? SFVideoViewController
        let viewModel = SFVideoViewModel()
        viewController?.bind(to: viewModel)
        return viewController
    }
}
