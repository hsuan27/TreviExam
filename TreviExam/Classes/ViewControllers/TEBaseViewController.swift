//
//  TEBaseViewController.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import UIKit

class TEBaseViewController: UIViewController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initBaseView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateBaseView()
    }
    
    func initBaseView() {
        
    }
    
    func updateBaseView() {
        switch self.navigationController?.viewControllers.last {
        case _ where self is TEFirstViewController:
            self.navigationController?.navigationBar.isHidden = true
        case _ where self is TESecondViewController:
            self.navigationController?.navigationBar.isHidden = false
        default:
            self.navigationController?.navigationBar.isHidden = false
        }
        
        self.edgesForExtendedLayout = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private Methods
    func pushSecondViewController(column: String, row: String) {
        TECore.shared.saveGridInfo(column: column, row: row)
        self.navigationController?.pushViewController(TESecondViewController(), animated: true)
    }
}
