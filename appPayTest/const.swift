//
//  const.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import Foundation


let SERVER_HOST = "http://10.17.2.253:8080"

let WX_APP_PAY = SERVER_HOST + "/wechat/orders"


func md5(_ string: String) -> String {
    print(string)
    let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
    var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
    CC_MD5_Init(context)
    CC_MD5_Update(context, string, CC_LONG(string.lengthOfBytes(using: String.Encoding.utf8)))
    CC_MD5_Final(&digest, context)
    context.deallocate(capacity: 1)
    var hexString = ""
    for byte in digest {
        hexString += String(format:"%02x", byte)
    }
    
    return hexString.uppercased()
}
