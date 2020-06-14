//
//  Target_Account.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

@objc class Target_Account: NSObject {
    @objc func Action_accountViewController(_ params: NSDictionary) -> UIViewController? {
        let bundle = Bundle(for: Target_Account.self)
        let storyboard = UIStoryboard(name: "Account", bundle: bundle)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SFAccountViewController") as? SFAccountViewController
        let viewModel = SFAccountViewModel()
        viewController?.bind(to: viewModel)
        return viewController
    }
}
