//
//  BaseView.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

import SnapKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureUI() {
        backgroundColor = .systemGroupedBackground
    }
    func setupLayout() { }
}
