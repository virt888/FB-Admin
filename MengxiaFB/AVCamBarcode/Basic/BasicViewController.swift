//
//  BasicViewController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {

    let backBtn = UIButton()
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    fileprivate let titleLabel = UILabel()
    var barTitle = "" {
        willSet(newValue) {
            titleLabel.text = newValue
            titleLabel.font = UIFont(name: "PingFang-HK", size: 14)
            let strRect = titleLabel.textRect(forBounds: CGRect.init(x: 0, y: 0, width: 300, height: 55), limitedToNumberOfLines: 1)
            titleLabel.frame = CGRect(x: (UIScreen.main.bounds.size.width - strRect.size.width)/2, y: 0, width: strRect.size.width, height: 44)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //backBtn default
        backBtn.setImage(UIImage(named: "btn_back.png"), for: UIControlState.normal)
        backBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 30)
        backBtn.frame = CGRect(x: 0, y: 0, width: 70, height: 55)
        backBtn.addTarget(self, action: #selector(backTo(sender:)), for: .touchUpInside)
        let BackToBt = UIBarButtonItem(customView: backBtn)
        navigationItem.leftBarButtonItems = [BackToBt]
        
        //default title
        titleLabel.textColor = UIColor.white
        
        titleLabel.textAlignment = NSTextAlignment.center
        
        //navigationController?.navigationBar.addSubview(titleLabel)
    }
    
    @objc func backTo(sender: UIButton) {
        _ = navigationController?.popViewController(animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
