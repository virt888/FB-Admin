//
//  HistoryViewController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class HistoryViewController: BasicViewController {
    @IBOutlet weak var startDateLab: UILabel!
    @IBOutlet weak var endDateLab: UILabel!
    @IBOutlet weak var totalAmoutLab: UILabel!
    @IBOutlet weak var historyTab: UITableView!
    var selectedStartDate: Date? = DateCalculator.getDayStartMoment(date: Date()) {
        willSet(new) {
            if new != nil {
                startDateLab.text = DateCalculator.ddMMMyyyy.string(from: new!)
            }
            
        }
    }
    var selectedEndDate: Date? = DateCalculator.getDayEndMoment(date: Date()) {
        willSet(new) {
            if new != nil {
                endDateLab.text = DateCalculator.ddMMMyyyy.string(from: new!)
            }
        }
    }
    var totalAmount: Double? {
        willSet(new) {
            if new != nil {
                totalAmoutLab.text = "HKD " + Int(new!).description
            }
        }
    }
    
    var recordArray = [TransactionRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lookup history"
        historyTab.delegate = self
        historyTab.dataSource = self
        historyTab.register(UINib.init(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
        historyTab.separatorStyle = .none
        
        startDateLab.text = DateCalculator.ddMMMyyyy.string(from: Date())
        endDateLab.text = DateCalculator.ddMMMyyyy.string(from: Date())
        // Do any additional setup after loading the view.
    }

    @IBAction func selectStartDate(_ sender: Any) {
        selectDate()
    }
    
    @IBAction func selectEndDate(_ sender: Any) {
        selectDate()
    }
    
    func selectDate() {
        let selectDateVC = SelectDateViewController()
        selectDateVC.selectDate = {(startDate,endDate) -> () in
            self.selectedStartDate = startDate
            self.selectedEndDate = endDate
        }
        navigationController?.pushViewController(selectDateVC, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recordArray = getRecord(startDate: selectedStartDate, endDate: selectedEndDate, amount: &totalAmount)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension HistoryViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        if let Checkcell = cell as? HistoryCell {
            if indexPath.row < recordArray.count {
                let recordHistory = recordArray[indexPath.row]
                Checkcell.record = recordHistory
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
