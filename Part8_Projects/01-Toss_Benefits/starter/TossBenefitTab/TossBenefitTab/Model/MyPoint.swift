//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by 안덕우 on 2/9/25.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
