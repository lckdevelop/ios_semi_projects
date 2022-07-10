//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by Chaekyeong Lee on 2022/07/10.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberChat: UILabel!
    @IBOutlet weak var chatDate: UILabel!
        
    func configure(_ chat: Chat) {
        profileImage.image = UIImage(named: chat.name)
        memberName.text = chat.name
        memberChat.text = chat.chat
        
        chatDate.text = dateFormatChange(date: chat.date)
    }
    
    func dateFormatChange(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        
        //let date:String = String(Date())
        
        let changeDateTmp = formatter.date(from: date) ?? formatter.date(from: date) ?? Date()
        let changeDate = formatter.string(from: changeDateTmp)
        
        return changeDate
        
    }
    
    
}
