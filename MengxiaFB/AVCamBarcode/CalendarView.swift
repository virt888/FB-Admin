//
//  CalendarView.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class CalendarView: UICollectionView {


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    @IBAction func takePicture(_ sender: Any) {
    }
    override func numberOfItems(inSection section: Int) -> Int {
        if let dataSource = self.dataSource {
            return dataSource.collectionView(self, numberOfItemsInSection: section)
        }else{
            return 0
        }
    }
    
    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        return self.dataSource?.collectionView(self, cellForItemAt: indexPath)
    }
    
}
