//
//  SFDiscoverServicesCell.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/17.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxSwift

@available(iOS 9.0, *)
class SFDiscoverServicesCell: SFBaseTableViewCell {

    @IBOutlet weak var contentStackView: UIStackView!
    
    @IBOutlet weak var recommandLabel: UILabel!
    private let disposeBag = DisposeBag()
    
    private var cellModel: SFDiscoverServicesCellModel!
    
    override func buildUI() {
        
        
        
    }

    override func bindViewModel() {
        guard let viewModel = viewModel as? SFDiscoverServicesCellModel else {
            return
        }
        cellModel = viewModel
    }
    
}
