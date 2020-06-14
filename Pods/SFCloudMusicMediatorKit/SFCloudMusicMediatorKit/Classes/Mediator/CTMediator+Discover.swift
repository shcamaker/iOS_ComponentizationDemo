//
//  CTMediator+Discover.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import CTMediator

private let discoverKitName = "SFCloudMusicDiscoverKit"
private let discoverTargetName = "Discover"
private let discoverViewControllerActionName = "discoverViewController"

public extension CTMediator {
    func discoverViewController() -> UIViewController? {
         let params = [kCTMediatorParamsKeySwiftTargetModuleName:discoverKitName] as [AnyHashable:Any]
         let viewController = self.performTarget(discoverTargetName, action: discoverViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
        return viewController
    }
}

