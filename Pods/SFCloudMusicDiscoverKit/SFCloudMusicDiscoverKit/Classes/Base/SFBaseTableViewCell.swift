//
//  SFBaseTableViewCell.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/15.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit

class SFBaseTableViewCell: UITableViewCell, BindableType {

    var viewModel: SFBaseCellModel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        buildUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        buildUI()
    }
    func buildUI() { }
    func bindViewModel() { }
}
