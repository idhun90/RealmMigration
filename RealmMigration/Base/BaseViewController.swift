//
//  BaseViewController.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupLayout()
    }
    
    func configureUI() { }
    func setupLayout() { }
}
