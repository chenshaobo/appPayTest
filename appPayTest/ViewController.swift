//
//  ViewController.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

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
        
        
        Alamofire.request(request).responseData{ res in
                // do whatever you want here
            let string = String(data: res.data!, encoding: String.Encoding.utf8)! as String
                // parse xml document
            print(string)
            let xml = XML.parse(res.data!)
            let req = PayReq()
            /* <xml>
                    <out_trade_no>636199753633145344</out_trade_no>
                    <sign>98CF973E8FDD1BEE69B0A1BA9393FAE6</sign>
                    <result_code>SUCCESS</result_code>
                    <prepay_id>wx201701141522448311c5685a0590628307</prepay_id>
                    <trade_type>APP</trade_type>
                    <return_code>SUCCESS</return_code>
                    <return_msg>OK</return_msg>
                    <mch_id>100010</mch_id>
                    <nonce_str>26f066c3c450b2ee92745e1a25209cf8</nonce_str>
               </xml>
            */
            let appID = xml["xml"]["parent_id"].text!
            let prepayID = xml["xml"]["prepay_id"].text!
            let timestamp = UInt32(Date().timestamp)
            req.openID = AppID
            req.partnerId = appID
            req.prepayId = prepayID
            req.nonceStr = self.payModel?.nonceStr
            req.timeStamp = timestamp
            req.package = "Sign=WXPay"
            req.sign = "appid="
            WXApi.send(req)
                
            print("appid=\(req.openID)\nparentid=\(req.partnerId)\nprepayid=\(req.prepayId)\nnoncestr=\(req.nonceStr)\ntimestamp=\(req.timeStamp)\npackage=\(req.package)\nsign=\(req.sign)")
        }
    }
    
    
    
}

