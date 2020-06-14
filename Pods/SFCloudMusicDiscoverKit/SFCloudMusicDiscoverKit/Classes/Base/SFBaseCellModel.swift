//
//  SFBaseCellModel.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

class SFBaseCellModel: NSObject {
    var cellID = ""
    init(withIdentifier cellID: String) {
        self.cellID = cellID
    }
}
