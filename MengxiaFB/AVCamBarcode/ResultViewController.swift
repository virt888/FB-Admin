//
//  ResultViewController.swift
//  editCell
//
//  Created by 陈梦霞 on 17/2/7.
//  Copyright © 2017年 陈梦霞. All rights reserved.
//

import UIKit
import Alamofire
class ResultViewController: UIViewController {
    let resultLab = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let titleLab = UILabel()
        titleLab.text = "The Result of Scan"
        titleLab.font = UIFont.systemFont(ofSize: 20)
        titleLab.textAlignment = .center
        view.addSubview(titleLab)
        titleLab.frame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 40)
        resultLab.numberOfLines = 0
        resultLab.frame = CGRect(x: UIScreen.main.bounds.width * 0.1, y: 150, width: UIScreen.main.bounds.width * 0.8, height: 150)
        resultLab.textAlignment = .center
        view.addSubview(resultLab)
        
        netWorkRequest()
    }
    
    func netWorkRequest() {
        let urlStr = "http://www.infoex.com.hk/php_iphone/cx/checkVoucher.php"
        var parameter = [String:AnyObject]()
        parameter["BARCODE"] = resultLab.text as AnyObject?
        parameter["SENDER"] = "MengXia" as AnyObject?
        
        
        Alamofire.request(urlStr,
                          method: .post, parameters: parameter).responseString(completionHandler: { (respone) in
                            
                            let alertController = UIAlertController(title: "Title", message: respone.description, preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                          })
        
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
