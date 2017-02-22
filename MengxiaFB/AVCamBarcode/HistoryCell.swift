//
//  HistoryCell.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var dateLab: UILabel!
    @IBOutlet weak var clientLab: UILabel!
    @IBOutlet weak var amountLab: UILabel!

    var record: TransactionRecord? {
        willSet(new) {
            dateLab.text = DateCalculator.ddMMMyyyy.string(from: (new?.date)!)
            clientLab.text = new?.client
            amountLab.text = "HKD " + (new?.amount.description)!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
