//
//  CheckPassengerViewViewController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/14.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class CheckPassengerViewViewController: UIViewController {
    @IBOutlet weak var transactionTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Check pssenger entitlement"
        let nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: "PingFang HK", size: 16)
        nextBtn.addTarget(self, action: #selector(gotoAttachReceiptView(sender:)), for: .touchUpInside)
        
        let barNexBt = UIBarButtonItem(customView: nextBtn)
        navigationItem.rightBarButtonItems = [barNexBt]
        transactionTable.register(UINib.init(nibName: "PaxCheckCell", bundle: nil), forCellReuseIdentifier: "PaxCheckCell")
        transactionTable.separatorStyle = .none
        //table
        transactionTable.delegate = self
        transactionTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
@objc func gotoAttachReceiptView(sender: UIButton) {
        let amountVC = InputAmountViewController()
        navigationController?.pushViewController(amountVC, animated: false)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CheckPassengerViewViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaxCheckCell", for: indexPath)
        if let Checkcell = cell as? PaxCheckCell {
            Checkcell.transactionItemLab.text = "TransactItem"
            Checkcell.amountLab.text = "HKD 150"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
