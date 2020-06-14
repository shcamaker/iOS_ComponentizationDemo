//
//  SFDiscoverViewController.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action

class SFDiscoverViewController: UIViewController, BindableType {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: SFDiscoverViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
        tableView.register(SFDiscoverCycleScrollCell.self, forCellReuseIdentifier: String(describing: SFDiscoverCycleScrollCell.self))
        if #available(iOS 9.0, *) {
            let bundle = Bundle(for: SFDiscoverViewController.self)
            tableView.register(UINib(nibName: String(describing: SFDiscoverServicesCell.self), bundle: bundle), forCellReuseIdentifier: String(describing: SFDiscoverServicesCell.self))
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func bindViewModel() {
        viewModel.items.bind(to: tableView.rx.items) { tv, indexPath, model in
            var cell = tv.dequeueReusableCell(withIdentifier: String(describing: model.cellID)) as? SFBaseTableViewCell
            cell?.bind(to: model)
            return cell!
        }.disposed(by: disposeBag)
    }
}
