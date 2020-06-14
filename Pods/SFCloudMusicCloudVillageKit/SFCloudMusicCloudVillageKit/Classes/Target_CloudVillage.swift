//
//  Target_CloudVillage.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

@objc class Target_CloudVillage: NSObject {
    @objc func Action_cloudVillageViewController(_ params: NSDictionary) -> UIViewController? {
        let bundle = Bundle(for: Target_CloudVillage.self)
        let storyboard = UIStoryboard(name: "CloudVillage", bundle: bundle)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SFCloundVillageViewController") as? SFCloundVillageViewController
        let viewModel = SFCloundVillageViewModel()
        viewController?.bind(to: viewModel)
        return viewController
    }
}

