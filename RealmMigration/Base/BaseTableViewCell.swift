//
//  BaseTableViewCell.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

import SnapKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureUI() {
        contentView.backgroundColor = .secondarySystemGroupedBackground
    }
    func setupLayout() { }
}
