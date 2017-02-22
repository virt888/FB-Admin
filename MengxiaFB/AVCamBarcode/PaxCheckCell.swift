//
//  PaxCheckCell.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/15.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class PaxCheckCell: UITableViewCell {
    @IBOutlet weak var transactionItemLab: UILabel!
    @IBOutlet weak var amountLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
