//
//  TransactionModel.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/15.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import Foundation
struct TransactionRecord {
    var orderID = ""
    var amount = 0.0
    var client = ""
    var date = Date()
    
    init(model: Transaction) {
        
        orderID = model.value(forKey: "orderID") as! String
        amount = model.value(forKey: "amount") as! Double
        client = model.value(forKey: "client") as! String
        date = model.value(forKey: "date") as! Date
    }
    
    init(order: String, Amount: Double, Client: String, Date: Date) {
        orderID = order
        amount = Amount
        client = Client
        date = Date
    }
}
