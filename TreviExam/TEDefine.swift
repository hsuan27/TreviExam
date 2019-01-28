//
//  TEDefine.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/28.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import Foundation
import UIKit

let kSize_Screen: CGSize = UIScreen.main.bounds.size
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kNavigationBar = TEUtility.getTopViewController().navigationController?.navigationBar
let kNavigationBarHeight = kNavigationBar?.frame.height ?? 0.0
typealias TECoordinate = (x: Int, y: Int)

public func LString(_ string: String) -> String {
    return  NSLocalizedString(string, comment: "")
}

let TEColor_Gray: UIColor = UIColor(netHex: 0x333333)
let TEColor_Highlight: UIColor = UIColor(netHex: 0x99CCCC)
let TEColor_Yellow: UIColor = UIColor(netHex: 0xFFFF66)
