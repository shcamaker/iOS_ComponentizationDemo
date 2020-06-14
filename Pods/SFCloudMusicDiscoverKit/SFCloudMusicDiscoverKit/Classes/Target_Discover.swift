//
//  Target_Discover.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/24/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

@objc class Target_Discover: NSObject {
    @objc func Action_discoverViewController(_ params: NSDictionary) -> UIViewController? {
        let bundle = Bundle(for: Target_Discover.self)
        let storyboard = UIStoryboard(name: "Discover", bundle: bundle)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SFDiscoverViewController") as? SFDiscoverViewController
        let viewModel = SFDiscoverViewModel()
        viewController?.bind(to: viewModel)
        return viewController
    }
}
