//
//  DompetAccountSections.swift
//  MiniPedia
//
//  Created by Agus Cahyono on 20/10/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class DompetAccountSections: Sections {
    
    internal var numberOfItems: Int = 1
    private var viewModel: HomeViewViewModel!
    private var disposeBag = DisposeBag()
    
    init(viewModel: HomeViewViewModel) {
        self.viewModel = viewModel
        self.viewModel.getAccountInfo()
        self.viewModel.fetchFakeBanner()
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(70))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )
        
        // add header
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "SectionHeaderElementKind",
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
        
    }
    
    func configureCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DompetAccountInfoCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        
        if let account = viewModel.bindInfoCell() {
            cell.configureCell(account)
        }
        
        return cell
    }
    
    func configureHeaderView(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        let header: FlashBannerView = collectionView.dequeueReusableSupplementaryView(ofKind: .header, forIndexPath: indexPath)
        
        if let banner = viewModel.bindFakeBanner() {
            header.bindFakeBanner(banner)
        }
        
        return header
    }
    
    func reuseIdentifier() -> String {
        return DompetAccountInfoCollectionViewCell.reuseIdentifier
    }
    
}
