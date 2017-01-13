//
//  ViewController.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mchIDTextField: UITextField!
    @IBOutlet weak var mchKeyTextField: UITextField!
    @IBOutlet weak var totalFee: UITextField!
    @IBOutlet weak var notifyUrlTextField: UITextField!
    @IBOutlet weak var tradeNoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func makeXMLBody(){
        
    }
}

