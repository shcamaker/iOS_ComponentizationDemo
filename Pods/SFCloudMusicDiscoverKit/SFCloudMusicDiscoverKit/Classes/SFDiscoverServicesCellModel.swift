//
//  SFDiscoverServicesCellModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/17.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxSwift

class SFDiscoverServicesCellModel: SFBaseCellModel {
    
    var services = Observable<[SFDiscoverService]>.from(optional: [
        SFDiscoverService(icon: "dis_main_recommend", serviceName: "每日推荐"),
        SFDiscoverService(icon: "dis_main_musicList", serviceName: "歌单"),
        SFDiscoverService(icon: "dis_main_rank", serviceName: "排行榜"),
        SFDiscoverService(icon: "dis_main_radio", serviceName: "电台"),
        SFDiscoverService(icon: "dis_main_live", serviceName: "直播"),
    ])
    
}
