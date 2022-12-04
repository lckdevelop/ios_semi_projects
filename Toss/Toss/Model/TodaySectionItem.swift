//
//  TodaySectionItem.swift
//  Toss
//
//  Created by Chaekyeong Lee on 2022/10/10.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    var today: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, today]
    }
}

extension TodaySectionItem {
    static let mock = TodaySectionItem(
        point: MyPoint(point: 0),
        today: Benefit.walk
    )
}
