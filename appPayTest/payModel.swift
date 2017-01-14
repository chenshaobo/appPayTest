//
//  payModel.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import Foundation
import Alamofire

struct PayModel{
    
    /*  
     <xml>
        <mch_id>100010</mch_id>
        <total_fee>10</total_fee>
        <out_trade_no>wx10001001100301</out_trade_no>
        <body>BODY unif 支付测试</body>
        <attach>ATTACH unif 订单额外描述</attach>
        <detail>DETAIL unif 刷卡支付测试</detail>
        <spbill_create_ip>127.0.0.1</spbill_create_ip>
        <notify_url>http://127.0.0.1:8080</notify_url>
        <nonce_str>158dcb83a6a44cd392a7b2b77995e9f6</nonce_str>
        <openid></openid><sub_openid></sub_openid>
        <trade_type>APP</trade_type>
        <sign>4EDE254D4A66C37C1662ABEF94AA86A4</sign>
     </xml>
     */
    let  mchID: String
    let  totalFee :String
    let  body = "appPay-body"
    let  detail = "appPay-detail"
    let  attach = "appPay-attach"
    let  spbillCreateIp = "127.0.0.1"
    let  notifyUrl:String
    let  nonceStr = "158dcb83a6a44cd392"
    let  tradeType = "APP"
    let  sign :String
    let  mchPayKey:String
    let  outTradeNo:String
    init(mchID:String,mchPayKey:String,outTradeNo:String,totalFee:String,notifyUrl:String?){
        self.mchID = mchID
        self.totalFee = totalFee
        self.mchPayKey = mchPayKey
        self.outTradeNo = outTradeNo
        if notifyUrl != nil {
            self.notifyUrl = notifyUrl!
        }else {
            self.notifyUrl = "http://127.0.0.1:8080"
        }

        let orderSpec = "attach=\(attach)&body=\(body)&detail=\(detail)&mch_id=\(self.mchID)&nonce_str=\(nonceStr)&notify_url=\(self.notifyUrl)&out_trade_no=\(self.outTradeNo)&spbill_create_ip=\(spbillCreateIp)&total_fee=\(self.totalFee)&trade_type=\(self.tradeType)&key=\(self.mchPayKey)"
        self.sign = md5(orderSpec)
        
    }
}


extension PayModel {
        func xml() -> String {
            let string = "<xml><mch_id><![CDATA[\(mchID)]]></mch_id><total_fee><![CDATA[\(totalFee)]]></total_fee><out_trade_no><![CDATA[\(outTradeNo)]]></out_trade_no><body><![CDATA[\(body)]]></body><attach><![CDATA[\(attach)]]></attach><detail><![CDATA[\(detail)]]></detail><spbill_create_ip><![CDATA[\(spbillCreateIp)]]></spbill_create_ip><notify_url><![CDATA[\(notifyUrl)]]></notify_url><nonce_str><![CDATA[\(nonceStr)]]></nonce_str><trade_type><![CDATA[\(tradeType)]]></trade_type><sign><![CDATA[\(sign)]]></sign></xml>"//<openid></openid><sub_openid></sub_openid>
            return string
        }
}



