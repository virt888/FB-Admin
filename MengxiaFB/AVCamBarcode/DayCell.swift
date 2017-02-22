//
//  DayCell.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

enum DayStyle {
    case NODay
    case startDate
    case seletedDate
    case endDate
    case normal
    case disable
}

class DayCell: UICollectionViewCell {
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var endView: UIView!
    @IBOutlet weak var dayLab: UILabel!
    @IBOutlet weak var backView: UIView!
    
    var dayStyle: DayStyle = .NODay {
        willSet(NewValue) {
            switch NewValue {
            case .NODay:
                backView.alpha = 0
                break
            case .startDate:
                backView.alpha = 1
                backView.backgroundColor = UIColor.lightGray
                startView.alpha = 1
                endView.alpha = 0
                dayLab.alpha = 1
                dayLab.font = UIFont.boldSystemFont(ofSize: 21)
                dayLab.textColor = UIColor.black
                break
            case .seletedDate:
                backView.alpha = 1
                backView.backgroundColor = UIColor(red: 235/255.0, green: 237/255.0, blue: 236/255.0, alpha: 1)
                startView.alpha = 0
                endView.alpha = 0
                dayLab.alpha = 1
                dayLab.font = UIFont.boldSystemFont(ofSize: 21)
                dayLab.textColor = UIColor.black
            case .endDate:
                backView.alpha = 1
                backView.backgroundColor = UIColor.lightGray
                startView.alpha = 0
                endView.alpha = 1
                dayLab.alpha = 1
                dayLab.textColor = UIColor.black
                dayLab.font = UIFont.boldSystemFont(ofSize: 21)
            case .normal:
                backView.alpha = 1
                backView.backgroundColor = UIColor.white
                startView.alpha = 0
                endView.alpha = 0
                dayLab.alpha = 1
                dayLab.textColor = UIColor(red: 74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1)
                dayLab.font = UIFont.systemFont(ofSize: 21)
            case .disable:
                backView.alpha = 1
                backView.backgroundColor = UIColor.white
                dayLab.textColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1)
                startView.alpha = 0
                endView.alpha = 0
                dayLab.alpha = 1
                dayLab.font = UIFont.systemFont(ofSize: 21)
            }
        }
    }
    
    var day: Date = Date()
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
