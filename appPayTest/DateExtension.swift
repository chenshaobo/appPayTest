//
//  DateExtension.swift
//  appPayTest
//
//  Created by lx on 17/1/14.
//  Copyright © 2017年 lx. All rights reserved.
//

import Foundation


extension Date {
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
}
