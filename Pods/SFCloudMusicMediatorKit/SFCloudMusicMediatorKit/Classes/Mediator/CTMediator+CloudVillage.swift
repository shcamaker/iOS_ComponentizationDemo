//
//  CTMediator+CloudVillage.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import CTMediator

private let cloudVillageKitName = "SFCloudMusicCloudVillageKit"
private let cloudVillageTargetName = "CloudVillage"
private let cloudVillageViewControllerActionName = "cloudVillageViewController"

public extension CTMediator {
    func cloudVillageViewController() -> UIViewController? {
        let params = [kCTMediatorParamsKeySwiftTargetModuleName:cloudVillageKitName] as [AnyHashable:Any]
         let viewController = self.performTarget(cloudVillageTargetName, action: cloudVillageViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
        return viewController
    }
}
