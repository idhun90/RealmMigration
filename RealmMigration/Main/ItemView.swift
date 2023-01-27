//
//  ItemView.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

final class ItemView: BaseView {
    
    let tappedTableView: UIButton = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "plus")
        config.title = "아이템 추가(테이블뷰)"
        config.imagePlacement = .leading
        config.imagePadding = 5
        let view = UIButton(configuration: config)
        return view
    }()
    
    let tappedCollectionView: UIButton = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "plus")
        config.title = "아이템 추가(컬렉션뷰)"
        config.imagePlacement = .leading
        config.imagePadding = 5
        let view = UIButton(configuration: config)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func configureUI() {
        super.configureUI()
    }
    
    override func setupLayout() {
        super.setupLayout()
        addSubview(tappedTableView)
        addSubview(tappedCollectionView)
        
        tappedTableView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        tappedCollectionView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tappedTableView.snp.bottom).offset(20)
        }
    }
}
