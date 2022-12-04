//
//  MyPoint.swift
//  Toss
//
//  Created by Chaekyeong Lee on 2022/10/10.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
    
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
