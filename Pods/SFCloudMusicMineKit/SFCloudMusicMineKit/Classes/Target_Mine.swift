//
//  Target_Mine.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

@objc class Target_Mine: NSObject {
    @objc func Action_mineViewController(_ params: NSDictionary) -> UIViewController? {
        let bundle = Bundle(for: Target_Mine.self)
        let storyboard = UIStoryboard(name: "Mine", bundle: bundle)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SFMineViewController") as? SFMineViewController
        let viewModel = SFMineViewModel()
        viewController?.bind(to: viewModel)
        return viewController
    }
}

