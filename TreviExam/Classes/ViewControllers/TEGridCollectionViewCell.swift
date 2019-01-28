//
//  TEGridCollectionViewCell.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import UIKit

protocol TEGridCollectionViewCellDelegate {
    func clickConfirm()
}

class TEGridCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var m_btnConfirm: UIButton!
    var m_vGrid: TEGridView! = TEGridView.initFromNib()
    var m_delegate: TEGridCollectionViewCellDelegate? = nil
    var m_iFocusX: Int = 0
    var m_iFocusY: Int = 0
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
     
        initView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func initView() {
        initGridView()
    }
    
    func initGridView() {
        m_vGrid.topAnchor.constraint(equalTo: self.topAnchor)
        m_vGrid.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        m_vGrid.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        m_vGrid.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        m_vGrid.setBackgroundColor(.lightGray)
        self.addSubview(m_vGrid)
    }
    
    //MAR: - IBAction
    @IBAction func clickConfrim(_ sender: Any) {
        m_delegate?.clickConfirm()
    }
    
    //MARK: - Configuration
    static func configure(_ cell: TEGridCollectionViewCell,
                          indexPath: IndexPath,
                          coordinate: TECoordinate) {
        cell.updateCell(indexPath, coordinate: coordinate)
    }
    
    //MARK: - Private Methods
    private func updateCell(_ indexPath: IndexPath,
                            coordinate: TECoordinate) {
        updateLastCellBy(section: indexPath.section)
        focusCellAt(indexPath, x: coordinate.x, y: coordinate.y)
        lockConfirmButtonAt(indexPath, x: coordinate.x, y: coordinate.y)
    }
    
    private func updateLastCellBy(section: Int) {
        if section == TECore.shared.m_iRow {
            m_vGrid.isHidden = true
            m_btnConfirm.isHidden = false
        } else {
            m_vGrid.isHidden = false
            m_btnConfirm.isHidden = true
        }
    }
    
    private func focusCellAt(_ indexPath: IndexPath, x: Int, y: Int) {
        if x == 0 && y == 0 {
            m_vGrid.setFocus(false)
        } else if indexPath.focusRow(x) && indexPath.focusSection(y) {
            m_vGrid.setFocus(true)
        } else {
            m_vGrid.setFocus(false)
        }
    }
    
    private func lockConfirmButtonAt(_ indexPath: IndexPath, x: Int, y: Int) {
        if indexPath.focusRow(x) {
            m_btnConfirm.backgroundColor = TEColor_Highlight
            m_btnConfirm.isEnabled = true
        } else {
            m_btnConfirm.backgroundColor = TEColor_Gray
            m_btnConfirm.isEnabled = false
        }
    }
}

extension IndexPath {
    var countingRow: Int {
        return self.row + 1
    }
    
    var countingSection: Int {
        return self.section + 1
    }
    
    func focusRow(_ x: Int) -> Bool {
        return self.countingRow == x
    }
    
    func focusSection(_ y: Int) -> Bool {
        return self.countingSection == y
    }
}
