//
//  UIApplicationExtension.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let alert = controller as? UIAlertController {
            if let presenting = alert.presentingViewController {
                return presenting
            }
        }
        
        if let presented = controller?.presentedViewController {
            if presented is UIAlertController == false {
                return topViewController(controller: presented)
            }
        }
        
        return controller
    }
}
