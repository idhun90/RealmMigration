//
//  ItemViewController.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

final class ItemViewController: BaseViewController {
    
    private let mainView = ItemView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        mainView.tappedTableView.addTarget(self, action: #selector(addItembyTableView), for: .touchUpInside)
        mainView.tappedCollectionView.addTarget(self, action: #selector(addItembyCollectionView), for: .touchUpInside)
    }
    
    @objc private func addItembyTableView() {
        let vc = AddViewController()
        vc.mainView.collectionView.isHidden = true
        present(vc, animated: true)
    }
    
    @objc private func addItembyCollectionView() {
        let vc = AddViewController()
        vc.mainView.tableView.isHidden = true
        present(AddViewController(), animated: true)
    }
}
