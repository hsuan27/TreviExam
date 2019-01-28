//
//  TETextField.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import UIKit

class TETextField: UITextField {
    var isEmpty: Bool {
        return (self.text?.isEmpty)!
    }
    
    var isZero: Bool {
        return Int(self.text ?? "") == 0
    }
}
