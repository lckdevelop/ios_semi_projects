//
//  FocusCell.swift
//  CollectionViewExam1
//
//  Created by Chaekyeong Lee on 2022/12/04.
//

import UIKit

class FocusCell: UICollectionViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    func configureUI(_ item: Focus) {
        mainLabel.text = item.title
        descriptionLabel.text = item.description
        weatherImage.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
    
    
}
