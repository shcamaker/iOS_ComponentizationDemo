//
//  SFDiscoverViewModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift

class SFDiscoverViewModel: NSObject {
    var items: Observable<[SFBaseCellModel]>
    
    override init() {
        
        self.items = Observable.just([SFDiscoverCycleScrollCellModel(withIdentifier: "SFDiscoverCycleScrollCell"),SFDiscoverServicesCellModel(withIdentifier: "SFDiscoverServicesCell")])
    }
    
    
}
