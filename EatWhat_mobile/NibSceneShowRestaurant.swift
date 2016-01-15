//
//  NibSceneShowRestaurant.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit

class NibSceneShowRestaurant: UIView {
  
  override func awakeFromNib() {
    //這裡的寫法看這裡
//   https://medium.com/@aommiez/afnetwork-integrate-swfit-80514b545b40#.lso3gtuzl 
    
    
    
    
    
    var strURL: String = "http://eatwhat-new.dev/restaurants.json"
//    var strAPIName: String = "get all address in settings"
//    if utilsObj.isShowLog {
//      NSLog("[api] %@", strAPIName)
//    }
//    manager.requestSerializer.setValue(utilsObj.kwUserAuthToken, forHTTPHeaderField: "auth_token")
    manager.GET(strURL, parameters: nil, success: {(operation: AFHTTPRequestOperation, responseObject: AnyObject) -> Void in
      if utilsObj.isShowLog {
        NSLog("response from %@  %@", strAPIName, responseObject!)
      }
      }, failure: {(operation: AFHTTPRequestOperation, error: NSError) -> Void in
        utilsObj.getErrorMessage(error!, andName: strAPIName)
    })
 
  }

  @IBAction func btnFunctionBack(sender: AnyObject) {
    UIView.animateWithDuration(0.5, animations: {() -> Void in
      self.frame = CGRect(
        x: UIScreen.mainScreen().bounds.width,
        y: 0,
        width: UIScreen.mainScreen().bounds.width,
        height: UIScreen.mainScreen().bounds.height
      )
      }, completion: {(finished: Bool) -> Void in
        self.removeFromSuperview()
    })
  }

}
