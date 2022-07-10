//
//  FrameWorkCell.swift
//  AppleFramework
//
//  Created by Chaekyeong Lee on 2022/07/10.
//

import UIKit

class FrameWorkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
    
    
    
    
    
    
    
}
