//
//  TEFirstViewController.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import UIKit

class TEFirstViewController: TEBaseViewController {
    @IBOutlet weak var m_txfColumn: TETextField!
    @IBOutlet weak var m_txfRow: TETextField!
    @IBOutlet weak var m_btnConfirm: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView()
    }
    
    func initView() {
        
    }
    
    func updateView() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    @IBAction func clickConfirm(_ sender: Any) {
        checkValues {
            self.pushSecondViewController(column: self.m_txfColumn.text!,
                                          row: self.m_txfRow.text!)
        }
    }
    
    //MARK: Private Methods
    private func checkValues(_ completion: @escaping ()->Void) {
        //column.row不可為空且數值需大於0
        if m_txfColumn.isEmpty == true ||
            m_txfRow.isEmpty == true {
            TEUtility.showRemind(msg: LString("AlertMessage:InputEmpty"))
            return
        } else if m_txfColumn.isZero == true {
            TEUtility.showRemind(msg: LString("AlertMessage:InputZero"))
            return
        } else if m_txfRow.isZero == true {
            TEUtility.showRemind(msg: LString("AlertMessage:InputZero"))
            return
        }
        
        completion()
    }

}
