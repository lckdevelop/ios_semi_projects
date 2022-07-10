//
//  StockRankViewController.swift
//  StockRank
//
//  Created by Chaekyeong Lee on 2022/07/10.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    // Data - 어떤 데이터?
    // Presentation - 셀을 어떻게 표현?
    // Layout - 셀을 어떻게 배치할꺼야?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self // StockRankViewController가 collectionView에게 데이터가 어떻게 되는지 알려줄거다.
        collectionView.delegate = self

    }
    
    
}

extension StockRankViewController: UICollectionViewDataSource {
    // collectionview에게 몇개의 cell이 필요한가
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return stockList.count
    }
    
    // 하나의 cell을 표현할 때 각 셀을 어떻게 표현할 것인가
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        
        return cell
    }

}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collecitonView
        
        // height == 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
