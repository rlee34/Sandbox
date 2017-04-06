//
//  ViewController.swift
//  Secret Swift
//
//  Created by Ryan Lee on 4/6/17.
//  Copyright © 2017 Creaky-Door. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var secret: UITextView!
    @IBAction func AuthenticateTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == NSNotification.Name.UIKeyboardWillHide {
            secret.contentInset = UIEdgeInsets.zero
        } else {
            secret.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        secret.scrollIndicatorInsets = secret.contentInset
        
        let selectedRange = secret.selectedRange
        secret.scrollRangeToVisible(selectedRange)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

