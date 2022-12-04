//
//  BannerCell.swift
//  CollectionViewExam2
//
//  Created by Chaekyeong Lee on 2022/12/04.
//

import UIKit

class BannerCell: UICollectionViewCell {
    @IBOutlet weak var BannerLabel: UILabel!    
    @IBOutlet weak var BannerDescription: UILabel!
    @IBOutlet weak var BannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 16
    }
    
    func configureUI(_ info: BannerInfo) {
        BannerLabel.text = info.title
        BannerDescription.text = info.description
        BannerImage.image = UIImage(named: info.imageName)
    }
    
}
