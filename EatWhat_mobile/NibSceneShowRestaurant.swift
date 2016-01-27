//
//  NibSceneShowRestaurant.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit
import Alamofire

class NibSceneShowRestaurant: UIView {
  
  override func awakeFromNib() {
    
    let strURL: String = "http://eatwhat-new.dev/restaurants.json"
    
    Alamofire.request(.GET, strURL)
      .responseJSON { response in
        print(response.request)  // original URL request
        print(response.response) // URL response
        print(response.data)     // server data
        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
          print("JSON: \(JSON)")
        }
    }
    
    
    
    
    
    
 
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
