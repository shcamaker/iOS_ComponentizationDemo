//
//  CTMediator+Mine.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import CTMediator

private let mineKitName = "SFCloudMusicMineKit"
private let mineTargetName = "Mine"
private let mineViewControllerActionName = "mineViewController"

public extension CTMediator {
    func mineViewController() -> UIViewController? {
        let params = [kCTMediatorParamsKeySwiftTargetModuleName:mineKitName] as [AnyHashable:Any]
         let viewController = self.performTarget(mineTargetName, action: mineViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
        return viewController
    }
}
