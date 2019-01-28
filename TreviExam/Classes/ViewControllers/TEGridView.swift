//
//  TEGridView.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import UIKit

class TEGridView: UIView {
    @IBOutlet weak var m_lbRandom: UILabel!
    @IBOutlet weak var m_vBottom: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setBackgroundColor(_ color: UIColor) {
        m_vBottom.backgroundColor = color
        self.backgroundColor = color.withAlphaComponent(0.1)
    }
    
    func setFocus(_ isFocus: Bool) {
        m_lbRandom.isHidden = isFocus == false
    }

}
