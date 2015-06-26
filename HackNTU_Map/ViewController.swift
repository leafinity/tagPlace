//
//  ViewController.swift
//  HackNTU_Map
//
//  Created by Zero Lin on 2015/6/25.
//  Copyright (c) 2015年 Zero Lin. All rights reserved.
//
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class UIController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}