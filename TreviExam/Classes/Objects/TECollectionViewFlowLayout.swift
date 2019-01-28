//
//  TECollectionViewFlowLayout.swift
//  TreviExam
//
//  Created by Hsuan on 2019/1/27.
//  Copyright © 2019年 Ting-Hsuan-Lee. All rights reserved.
//

import UIKit

class TECollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        
        self.collectionView?.isPagingEnabled = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.showsVerticalScrollIndicator = false
        self.minimumLineSpacing = 5
        self.minimumInteritemSpacing = 5
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
