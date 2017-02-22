//
//  PickerPhotoViewController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/14.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class PickerPhotoViewController: UIImagePickerController {

    @IBOutlet weak var buttonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceType = .camera
        allowsEditing = true
        showsCameraControls = false
        cameraOverlayView = buttonView
        cameraOverlayView?.addSubview(buttonView)
        // Do any additional setup after loading the view.
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
