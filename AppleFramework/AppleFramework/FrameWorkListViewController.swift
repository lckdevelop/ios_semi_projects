//
//  FrameWorkListViewController.swift
//  AppleFramework
//
//  Created by Chaekyeong Lee on 2022/07/10.
//

import UIKit

class FrameWorkListViewController: UIViewController {
    let frameworkList: [AppleFramework] = AppleFramework.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Estimate size 코드로 구현할 경우
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = .zero
//        }
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 6, bottom: 0, right: 6)
    }

}

extension FrameWorkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return frameworkList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameWorkCell", for: indexPath) as? FrameWorkCell else {
            return UICollectionViewCell()
        }
        
        let framework = frameworkList[indexPath.item]
        cell.configure(framework)
        
        return cell
    }
}

extension FrameWorkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 한 줄에 3개
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 12

        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 3) / 3
        let height = width * 1.5

        return CGSize(width: width, height: height)
        
        // 한 줄에 4개
//        let interItemSpacing: CGFloat = 10
//        let padding: CGFloat = 12
//
//        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 4) / 4
//        let height = width * 2
//
//        return CGSize(width: width, height: height)
        
        // 한 줄에 2개
//        let interItemSpacing: CGFloat = 20
//        let padding: CGFloat = 12
//
//        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2) / 2
//        let height = width * 1.4
//
//        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
}
