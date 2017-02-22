//
//  ConfirmView.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/15.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit



class ConfirmView: UIView {
var afterConfirm: (() -> ())?
    @IBAction func confirm(_ sender: Any) {
        if let success = afterConfirm {
            success()
        }
        self.removeFromSuperview()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
