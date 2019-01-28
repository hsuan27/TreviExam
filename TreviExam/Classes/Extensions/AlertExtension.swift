//
//  AlertExtension.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    static func showAlert(_ viewController:UIViewController,
                          title:String?,
                          msg:String?,
                          confirmTitle:String?,
                          cancelTitle:String?,
                          completionHandler: @escaping ()->Void)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle:UIAlertControllerStyle.alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: { (action: UIAlertAction!) in
            completionHandler()
        })
        
        alert.addAction(confirmAction)
        
        if cancelTitle != nil {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action: UIAlertAction!) in
                
            })
            alert.addAction(cancelAction)
            
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showAlert(_ viewController:UIViewController,
                          title:String?,
                          msg:String?,
                          confirmTitle:String?,
                          cancelTitle:String?,
                          completionHandler: @escaping ()->Void,
                          cancelHandler: @escaping ()->Void)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle:UIAlertControllerStyle.alert)
        
        if cancelTitle != nil {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: { (action: UIAlertAction!) in
                cancelHandler()
            })
            alert.addAction(cancelAction)
        }
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: { (action: UIAlertAction!) in
            completionHandler()
        })
        
        alert.addAction(confirmAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
