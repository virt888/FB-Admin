//
//  DataTool.swift
//  Mengxia CX
//
//  Created by 陈梦霞 on 17/2/11.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func getContex() -> NSManagedObjectContext {
    let container = NSPersistentContainer(name: "DataModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error {
            
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
        }
    })
    return container.viewContext
}

func storeRecord(record: TransactionRecord,success: (() -> ())?,faile: ((_ errorInfo: String) -> ())?) {
    let contex = getContex()
    let recordModel = NSEntityDescription.entity(forEntityName: "Transaction", in: contex)
    let scanRecord = NSManagedObject(entity: recordModel!, insertInto: contex)
    scanRecord.setValue(record.orderID, forKey: "orderID")
    scanRecord.setValue(record.amount, forKey: "amount")
    scanRecord.setValue(record.client, forKey: "client")
    scanRecord.setValue(record.date, forKey: "date")
    
    do {
        try contex.save()
        if let doSuccess = success {
            doSuccess()
        }
    }
    catch{
        if let doFail = faile {
            doFail(error.localizedDescription)
        }
    }

}

func getAllRecord() -> [TransactionRecord] {
    var recordList = [TransactionRecord]()
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Transaction")
    do {
        let result = try getContex().fetch(fetchRequest)
        for item in (result as! [NSManagedObject]) {
            if let record = item as? Transaction {
                recordList.append(TransactionRecord(model:record ))
            }
            
        }
    } catch {
        print(error.localizedDescription)
    }
    return recordList
}

func getRecord(startDate: Date?,endDate: Date?, amount: inout Double?) -> [TransactionRecord] {
    var sum = 0.0
    let recordList = getAllRecord()
    if startDate == nil && endDate == nil {
        for record in recordList {
            sum += record.amount
        }
        amount = sum
        return recordList
    }
    
    var result = [TransactionRecord]()
    for record in recordList {
        if startDate == nil {
            if record.date <= endDate! {
                result.append(record)
                sum += record.amount
            }
        }else if endDate == nil {
            if record.date >= startDate! {
                result.append(record)
                sum += record.amount
            }
        }else {
            if record.date >= startDate! && record.date <= endDate! {
                result.append(record)
                sum += record.amount
            }
        }
    }
    amount = sum
    
    return result
}
