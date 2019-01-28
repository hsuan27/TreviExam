//
//  ViewExtension.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func initFromNib() -> Self {
        return initFromNib(self)
    }
    
    private class func initFromNib<T: UIView>(_ type: T.Type) -> T {
        let objects = Bundle.main.loadNibNamed(String(describing: self), owner: self, options: [:])
        return objects?.first as? T ?? T()
    }
    
    public class func loadFromNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
