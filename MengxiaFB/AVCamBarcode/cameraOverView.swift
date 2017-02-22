//
//  cameraOverView.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/14.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class cameraOverView: UIView {
    weak var camera = UIImagePickerController()
    @IBAction func takePhoto(_ sender: Any) {
        camera?.takePicture()
    }

    


}

