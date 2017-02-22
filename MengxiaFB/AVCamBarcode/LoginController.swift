//
//  LoginController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/13.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class LoginController: BasicViewController {
    let icon = UIImageView(image: UIImage(named: "cx-logo-white"))
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icon.frame = CGRect(x: (UIScreen.main.bounds.width - 29)/2, y: (44 - 29)/2, width: 29, height: 29)
        
        
    }
    
    @IBAction func login(_ sender: Any) {
        if self.navigationController?.viewControllers.first == self {
            if let cameraVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController {
                navigationController?.pushViewController(cameraVC, animated: true)
            }
        } else {
            let historyVC = HistoryViewController()
            navigationController?.pushViewController(historyVC, animated: false)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.viewControllers.first == self {
            icon.removeFromSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.viewControllers.first == self {
            navigationController?.navigationBar.addSubview(icon)
            backBtn.alpha = 0
        }else {
            title = "Log in history page"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
