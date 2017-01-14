//
//  AppDelegate.swift
//  appPayTest
//
//  Created by lx on 17/1/13.
//  Copyright © 2017年 lx. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WXApiDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        WXApi.registerApp(AppID,withDescription: "由支付")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        print("openURL:\(url.absoluteString)")
        
        if url.scheme == AppID {
            return WXApi.handleOpen(url, delegate: self)
        }
        
        //跳转支付宝钱包进行支付，处理支付结果
        //  AlipaySDK.defaultService().processOrder(withPaymentResult: url, standbyCallback: {
        //  (success: Bool, error: Error?) -> Void in
        //    print("openURL result: \(success,error)")
        //    })
        
        return true
    }
    
    func onResp(_ resp: BaseResp!) {
        //var strTitle = "支付结果"
        var strMsg = "\(resp.errCode)"
        if resp.isKind(of: PayResp.self) {
            switch resp.errCode {
            case 0 :
                //NotificationCenter.default.post(name: Notification.Name(rawValue: WXPaySuccessNotification), object: nil)
                print("notify ok")
            default:
                strMsg = "支付失败，请您重新支付!"
                print("retcode = \(resp.errCode), retstr = \(resp.errStr)")
            }
        }
        //let alert = UIAlertView(title: nil, message: strMsg, delegate: nil, cancelButtonTitle: "好的")
        //alert.show()
    }
    



}

