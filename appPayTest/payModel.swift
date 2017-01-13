//
//  payModel.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import Foundation



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
    let  mchID: String?
    let  totalFee :String?
    let  body = "app支付-测试-body"
    let  detail = "app支付-测试-detail"
    let  spbillCreate_ip = ""
    let  spbitifyUrl:String?
    let  nonceStr:String?
    let  tradeType = "APP"
    let  sign :String?
    init(mchID:String,
         totalFee:String){
        self.mchID = mchID,
        self.totalFee = totalFee,
        
    }
}
