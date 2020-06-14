//
//  SFHomeTabCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator

enum HomeRoute: Route {
    case news
    case userList
}

class SFHomeTabCoordinator: TabBarCoordinator<HomeRoute> {

    convenience init() {
        let discoverCoordinator = SFDiscoverCoordinator()
        discoverCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "发现", image: UIImage(named: "tab_discovery_normal"), selectedImage: UIImage(named: "tab_discovery_selected"))

        let videoCoordinator = SFVideoCoordinator()
        videoCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "视频", image: UIImage(named: "tab_video_normal"), selectedImage: UIImage(named: "tab_video_selected"))

        let mineCoordinator = SFMineCoordinator()
        mineCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "tab_mine_normal"), selectedImage: UIImage(named: "tab_mine_selected"))
        
        let cloudVillageCoordinator = SFCloudVillageCoordinator()
        cloudVillageCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "云村", image: UIImage(named: "tab_cloudVillage_normal"), selectedImage: UIImage(named: "tab_cloudVillage_selected"))
        
        let accountCoordinator = SFAccountCoordinator()
        accountCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "账号", image: UIImage(named: "tab_account_normal"), selectedImage: UIImage(named: "tab_account_selected"))
        
        self.init(discoverRouter: discoverCoordinator.strongRouter, videoRouter: videoCoordinator.strongRouter, mineRouter:mineCoordinator.strongRouter, cloudVillage: cloudVillageCoordinator.strongRouter, accountRouter: accountCoordinator.strongRouter)
    }

    init(discoverRouter: StrongRouter<DiscoverRoute>,
         videoRouter: StrongRouter<VideoRoute>, mineRouter: StrongRouter<MineRoute>, cloudVillage: StrongRouter<CloudVillageRoute>, accountRouter: StrongRouter<AccountRoute>) {
        super.init(tabs: [discoverRouter, videoRouter, mineRouter, cloudVillage, accountRouter], select: discoverRouter)
    }

}
