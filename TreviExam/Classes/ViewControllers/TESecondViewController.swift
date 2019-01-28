//
//  TESecondViewController.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

private let kCellIdentifier = "TEGridCollectionViewCell"

import UIKit

class TESecondViewController: TEBaseViewController, TEGridCollectionViewCellDelegate {
    @IBOutlet weak var m_cvGrid: UICollectionView!
    
    var m_timer: Timer? = nil
    var m_iRandomX: Int = 0
    var m_iRandomY: Int = 0
    var m_iFinalRow: Int {
        //+1 for the confirm button at bottom
        return TECore.shared.m_iRow + 1
    }

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopTimer()
    }
    
    func initView() {
        registerGrid()
        starTimer()
    }
    
    func updateView() {
        m_cvGrid.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    func clickConfirm() {
        m_iRandomX = 0
        m_iRandomY = 0
        updateView()
    }
    
    //MARK: Private Methods
    private func registerGrid() {
        m_cvGrid.delegate = self
        m_cvGrid.dataSource = self
        m_cvGrid.collectionViewLayout = TECollectionViewFlowLayout()
        m_cvGrid.register(TEGridCollectionViewCell.loadFromNib(), forCellWithReuseIdentifier: kCellIdentifier)
    }
    
    private func starTimer() {
        m_timer = Timer.scheduledTimer(withTimeInterval: 10,
                                       repeats: true,
                                       block: { (_) in
                                  self.configureRanodmNumber()
        })
    }
    
    private func stopTimer() {
        if m_timer != nil {
            m_timer?.invalidate()
        }
    }
    
    private func configureRanodmNumber() {
        m_iRandomX = TECore.shared.getRanodmNumber(TECore.shared.m_iColumn)
        m_iRandomY = TECore.shared.getRanodmNumber(TECore.shared.m_iRow)
        updateView()
        print("random column: \(m_iRandomX)\nrandom row: \(m_iRandomY)")
    }
}

extension TESecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return m_iFinalRow
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TECore.shared.m_iColumn
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifier, for: indexPath) as! TEGridCollectionViewCell
        
        TEGridCollectionViewCell.configure(cell,
                                           indexPath: indexPath,
                                           coordinate: (m_iRandomX, m_iRandomY))
        cell.m_delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let iCoumn = TECore.shared.m_iColumn
        let iRow = m_iFinalRow
        let iCSpacing = (collectionView.collectionViewLayout as! TECollectionViewFlowLayout).minimumLineSpacing * CGFloat(iCoumn - 1)
        
        return CGSize(width: Int((collectionView.frame.width - iCSpacing)/CGFloat(iCoumn)) ,
                      height: Int(collectionView.frame.height/CGFloat(iRow)))
    }
    
}
