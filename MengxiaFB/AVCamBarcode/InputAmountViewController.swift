//
//  InputAmountViewController.swift
//  MengxiaFB
//
//  Created by 陈梦霞 on 17/2/14.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class InputAmountViewController: BasicViewController {
    @IBOutlet weak var photoView: UIImageView!

    @IBOutlet weak var inputAmout: UITextField!
    @IBOutlet weak var touchView: UIView!
    
    @IBOutlet weak var inputBackView: UIView!

    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    var originRect = CGRect.zero
    var comfireView = Bundle.main.loadNibNamed("ConfirmView", owner: nil, options: nil)?.last as? ConfirmView
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Input amount"
        //textField
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChange(notifiction:)), name: .UIKeyboardWillChangeFrame, object: nil)
        
       
        inputAmout.delegate = self
        inputAmout.keyboardType = .phonePad
        //Camera
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .camera
        pickerVC.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            pickerVC.showsCameraControls = false
            if let view = Bundle.main.loadNibNamed("cameraOverView", owner: nil, options: nil)?.last as? cameraOverView {
                view.frame = (pickerVC.cameraOverlayView?.frame)!
                view.camera = pickerVC
                
                present(pickerVC, animated: false, completion: {
                    pickerVC.cameraOverlayView = view
                })
            }
            //present(pickerVC, animated: true, completion: nil)
        }
        
        
        //touch gesture
        photoView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeybord(gesture:)))
        photoView.addGestureRecognizer(tapGesture)
        
        touchView.isMultipleTouchEnabled = true
        let touchToInput = UITapGestureRecognizer(target: self, action: #selector(inputAmout(gesture:)))
        touchView.addGestureRecognizer(touchToInput)
        originRect = inputBackView.frame
        // Do any additional setup after loading the view.
        let confirmBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        confirmBtn.setTitle("Confirm", for: .normal)
        confirmBtn.titleLabel?.font = UIFont(name: "PingFang HK", size: 16)
        confirmBtn.addTarget(self, action: #selector(confirm(sender:)), for: .touchUpInside)
        
        let barConfirmBt = UIBarButtonItem(customView: confirmBtn)
        navigationItem.rightBarButtonItems = [barConfirmBt]
        
        
        if  comfireView != nil {
            comfireView?.frame = CGRect(x: (UIScreen.main.bounds.size.width - 200)/2, y: (UIScreen.main.bounds.size.height - 220)/2, width: 200, height: 200)
            comfireView?.afterConfirm = { () -> () in
                
                for item in (self.navigationController?.viewControllers)! {
                    print(item)
                    if  item.isKind(of: CameraViewController.self) {
                        _ = self.navigationController?.popToViewController(item, animated: true)
                        
                        break
                    }
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func confirm(sender: UIButton) {
        if self.inputAmout.isEditing {
            self.inputAmout.resignFirstResponder()
        }
        
        let count = getAllRecord().count
        let record = TransactionRecord(order: count.description, Amount: Double(inputAmout.text!)!, Client: "Lily", Date: Date())
        storeRecord(record: record, success: { 
            if self.comfireView != nil {
                self.view.addSubview(self.comfireView!)
            }
        }) { (error) in
            print(error)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    @objc func dismissKeybord(gesture: UITapGestureRecognizer) {
        inputAmout.resignFirstResponder()
    }
    
    @objc func inputAmout(gesture: UITapGestureRecognizer) {
        guard !inputAmout.isEditing else {
            return
        }
        inputAmout.isEnabled = true
        inputAmout.becomeFirstResponder()
    }
    
    @objc func keyboardChange(notifiction: NSNotification) {
        if let rect = notifiction.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            //print(notifiction.userInfo,rect)
            if rect.origin.y < UIScreen.main.bounds.size.height {
                inputViewBottom.constant = rect.size.height + 5
            }else {
                inputViewBottom.constant = 30
                inputAmout.isEnabled = false
                inputBackView.frame = originRect
            }
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

extension InputAmountViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //print(info)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoView.image = image
        }
        inputAmout.becomeFirstResponder()
        picker.dismiss(animated: true, completion: nil)
    }
   
}

extension InputAmountViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
