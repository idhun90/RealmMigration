//
//  AddView.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

final class AddView: BaseView {
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.register(AddTableViewCell.self,
                      forCellReuseIdentifier: AddTableViewCell.Identifier)
        view.rowHeight = 44
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.backgroundColor = .systemGroupedBackground
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
        backgroundColor = .systemIndigo
    }
    
    override func setupLayout() {
        super.setupLayout()
        addSubview(tableView)
        addSubview(collectionView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AddView {
    
    private func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
