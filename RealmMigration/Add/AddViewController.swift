//
//  AddViewController.swift
//  RealmMigration
//
//  Created by 도헌 on 2023/01/27.
//

import UIKit

private enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
    case name, brand, color, fit, size, price, orderDate, satisfaction, url, memo
    
    var description: String {
        switch self {
        case .name: return "제품명"
        case .brand: return "브랜드"
        case .color: return "색상"
        case .fit: return "핏"
        case .size: return "사이즈"
        case .price: return "가격"
        case .orderDate: return "구매일"
        case .satisfaction: return "만족도"
        case .url: return "url"
        case .memo: return "메모"
        }
    }
    
}

struct Item: Hashable {
    let title: String
    private let identifier = UUID()
}

final class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureCollectionView()
        configureDataSource()
        configureSnapshots()
    }
    
}

extension AddViewController: UICollectionViewDelegate {
    
    private func configureCollectionView() {
        mainView.collectionView.delegate = self
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, indexPath, itemIdentifier in
            
            var contentConfiguration = UIListContentConfiguration.valueCell()
            contentConfiguration.text = Section.allCases[indexPath.section].description
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
        })
    }
    
    private func configureSnapshots() {
        
        for section in Section.allCases {
            var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<String>()
            let item = [section.description]
            sectionSnapshot.append(item)
            dataSource.apply(sectionSnapshot, to: section, animatingDifferences: false)
            
        }
    }
    
}

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func configureTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
        
        // 제품명, 브랜드, 색상, 핏, 사이즈, 가격, 구매일, 만족도, url, 메모
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 4 ? 4 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.Identifier, for: indexPath) as? AddTableViewCell else { return UITableViewCell() }
        
        //cell.textLabel?.text = Section.allCases[indexPath.section].description
        //print(cell.separatorInset) // 좌우 인셋 체크
        //print(cell.layoutMargins, "dd")
        
        var content = cell.defaultContentConfiguration()
        content.prefersSideBySideTextAndSecondaryText = true
        content.text = Section.allCases[indexPath.section].description
        cell.contentConfiguration = content
        
//        guard let section = Section(rawValue: indexPath.section) else { return UITableViewCell() }
//
//        switch section {
//        case .name:
//            cell.textLabel?.text = Section.allCases[indexPath.section].description
//        case .brand:
//            <#code#>
//        case .color:
//            <#code#>
//        case .fit:
//            <#code#>
//        case .size:
//            <#code#>
//        case .price:
//            <#code#>
//        case .orderDate:
//            <#code#>
//        case .satisfaction:
//            <#code#>
//        case .url:
//            <#code#>
//        case .memo:
//            <#code#>
//        }
        
        return cell
    }
    
    
}
