//
//  GradientBtn.swift
//  PaxInsight
//
//  Created by 陈梦霞 on 17/1/11.
//  Copyright © 2017年 Mengxia. All rights reserved.
//

import UIKit

class GradientBtn: UIButton {
    var starColor: CGColor = UIColor(red: 80/225.0, green: 144/255.0, blue: 147/255.0, alpha: 1.0).cgColor
    var endColor: CGColor = UIColor(red: 11/225.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0).cgColor {
        didSet(oldValue){
            setNeedsDisplay()
        }
    }
    override var isEnabled: Bool {
        willSet(newValue) {
            if !newValue {
                starColor = UIColor(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1).cgColor
                endColor = UIColor(red: 227/255.0, green: 227/255.0, blue: 227/255.0, alpha: 1).cgColor
            }else {
                starColor = UIColor(red: 183/225.0, green: 48/255.0, blue: 60/255.0, alpha: 1.0).cgColor
                endColor = UIColor(red: 148/225.0, green: 23/255.0, blue: 36/255.0, alpha: 1.0).cgColor
            }
        }
    }
    fileprivate let gradientColorLayer = CAGradientLayer()

    override func draw(_ rect: CGRect) {
        gradientColorLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        gradientColorLayer.colors = [starColor,endColor]
        setTitleColor(UIColor.white, for: .normal)
//        layer.cornerRadius = 6
//        clipsToBounds = true
        layer.insertSublayer(gradientColorLayer, at: 0)
    }

}
