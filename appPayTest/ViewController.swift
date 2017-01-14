//
//  ViewController.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    var payModel:PayModel?
    @IBOutlet weak var mchIDTextField: UITextField!
    @IBOutlet weak var mchKeyTextField: UITextField!
    @IBOutlet weak var totalFee: UITextField!
    @IBOutlet weak var notifyUrlTextField: UITextField!
    @IBOutlet weak var tradeNoTextField: UITextField!
    @IBOutlet weak var payButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func doPay(_ sender: Any) {
        if self.mchIDTextField.text?.isEmpty == true {
            self.mchIDTextField.text = self.mchIDTextField.placeholder!
        }
        if self.mchIDTextField.text?.isEmpty == true{
            self.mchKeyTextField.text = self.mchIDTextField.placeholder!
        }
        if self.totalFee.text?.isEmpty == true {
            self.totalFee.text = self.totalFee.placeholder!
        }
        if self.tradeNoTextField.text?.isEmpty == true {
            self.tradeNoTextField.text = String(Date().ticks)
        }
        if self.mchKeyTextField.text?.isEmpty == true {
            self.mchKeyTextField.text = self.mchKeyTextField.placeholder!
        }
        
        if self.notifyUrlTextField.text?.isEmpty == true {
            self.notifyUrlTextField.text = self.notifyUrlTextField.placeholder!
        }
        
        if self.tradeNoTextField.text?.isEmpty == true {
            self.tradeNoTextField.text = self.tradeNoTextField.placeholder!
        }

        self.payModel = PayModel(mchID: mchIDTextField.text!,mchPayKey:self.mchKeyTextField.text!, outTradeNo:tradeNoTextField.text!,totalFee: self.totalFee.text!, notifyUrl: self.notifyUrlTextField.text)
        var request = URLRequest(url: URL(string: WX_APP_PAY)!)
        request.httpMethod = "POST"
        request.setValue("application/xml", forHTTPHeaderField: "Content-Type")
        request.httpBody = payModel?.xml().data(using: String.Encoding.utf8)
        
        
        Alamofire.request(request as URLRequestConvertible)
            .responseData{ res in
                // do whatever you want here
            print((String(data: res.data!, encoding: String.Encoding.utf8)! as String))

        }
    }
    
    
    
}

