//
//  NavigationController.swift
//  CX Admin
//
//  Created by 陈梦霞 on 17/2/9.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationBar.barTintColor = UIColor(red: 11/225.0, green: 101/255.0, blue: 100/255.0, alpha: 1.0)
        let backImage = UIImageView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
            backImage.image = UIImage(named: "naviga")
        navigationBar.setBackgroundImage(backImage.image, for: .default)
        
        navigationBar.titleTextAttributes = {[
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "PingFang HK", size: 16)!
            ]}()
        
        //navigationBar.setBackgroundImage(backImage, for: .any, barMetrics: .default)
        navigationBar.isTranslucent = false
        //navigationBar.tintColor = UIColor.white
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
