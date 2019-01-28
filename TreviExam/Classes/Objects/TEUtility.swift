//
//  TEUtility.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import Foundation
import UIKit

final class TEUtility: NSObject {
    static func getTopViewController() -> UIViewController {
        return UIApplication.topViewController()!
    }
    
    static func showRemind(msg: String) {
        TEUtility.showRemind(msg: msg, completionHandler: {})
    }
    
    static func showRemind(msg: String, completionHandler: @escaping ()->Void) {
        TEUtility.showRemind(title: LString("AlertTitle:Remind"),
                             msg: msg,
                             confirmTitle: LString("AlertAction:Confirm"),
                             completionHandler: completionHandler)
    }
    
    static func showRemind(title: String,
                           msg: String,
                           confirmTitle: String,
                           completionHandler: @escaping ()->Void) {
        UIAlertController.showAlert(TEUtility.getTopViewController(),
                                    title: title,
                                    msg: msg,
                                    confirmTitle: confirmTitle,
                                    cancelTitle: nil,
                                    completionHandler: completionHandler)
    }
}
