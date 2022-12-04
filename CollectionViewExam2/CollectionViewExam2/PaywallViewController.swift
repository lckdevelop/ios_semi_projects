//
//  PaywallViewController.swift
//  CollectionViewExam2
//
//  Created by Chaekyeong Lee on 2022/12/04.
//

import UIKit

class PaywallViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerInfos: [BannerInfo] = BannerInfo.list
    let colors:[UIColor] = [.purple, .orange, .systemPink, .systemRed]
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    enum Section {
            case main
        }
    typealias Item = BannerInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentation
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            
            cell.configureUI(item)
            
            cell.backgroundColor = self.colors[indexPath.item]
            
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
                snapshot.appendItems(bannerInfos, toSection: .main)
        datasource.apply(snapshot)
        
        //layout
        collectionView.collectionViewLayout = updateLayout()
        collectionView.alwaysBounceVertical = false
                
        self.pageControl.numberOfPages = bannerInfos.count
    }
    
    
    private func updateLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // group이 cell의 크기를 벗어나자 horizontal이 아닌 vertical로 보여짐
        // orthogonalScrollingBehavior: 수평 스크롤 사용을 명시
        // groupPagingCentered : 페이징이 가운데를 기준으로
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20 // 그룹간 간격 20
        
        section.visibleItemsInvalidationHandler = { (items, offset, env) in
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
