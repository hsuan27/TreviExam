//
//  TECore.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import Foundation

class TECore: NSObject {
    static let shared: TECore = TECore()
    var m_iColumn: Int = 0
    var m_iRow: Int = 0
    
    func saveGridInfo(column: String, row: String) {
        m_iColumn = Int(column)!
        m_iRow = Int(row)!
    }
    
    func getRanodmNumber(_ bound: Int) -> Int {
        return Int((arc4random_uniform(UInt32(bound)) + 1))
    }
}
