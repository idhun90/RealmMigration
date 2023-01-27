//
//  AddViewTableViewCell.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

final class AddTableViewCell: BaseTableViewCell {
    
    static let Identifier = String(describing: AddTableViewCell.self)
    
    let textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = "입력하세요"
        view.textAlignment = .right
        view.font = .systemFont(ofSize: 17)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func configureUI() {
        super.configureUI()
    }
    
    override func setupLayout() {
        super.setupLayout()
        contentView.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.trailing.equalTo(contentView).offset(-20)
            $0.leading.greaterThanOrEqualTo(textLabel!.snp.trailing).offset(20)
        }
    }
}
