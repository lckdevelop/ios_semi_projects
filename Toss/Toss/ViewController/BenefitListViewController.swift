//
//  BenefitListViewController.swift
//  Toss
//
//  Created by Chaekyeong Lee on 2022/10/10.
//

import UIKit

class BenefitListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AnyHashable
    
    enum Section {
        case today
        case other
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    var todaySectionItems: [AnyHashable] = TodaySectionItem(point: .default, today: .today).sectionItems
    var otherSectionItems: [AnyHashable] = [Benefit.others]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            return nil
            
            
        })
            
        navigationItem.title = "혜택"
    }
    


}
