//
//  Utils.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//
import UIKit

class Utils {
  
  class var sharedInstance : Utils {
    struct Static {
      static let instance : Utils = Utils()
    }
    return Static.instance
  }
  
  
  
  func showSceneNib(nibName: String) -> UIView {
    
    let nibSceneCreateRestaurant: UIView = NSBundle.mainBundle().loadNibNamed(nibName, owner: self, options: nil)[0] as! NibSceneCreateRestaurant
    nibSceneCreateRestaurant.frame = UIScreen.mainScreen().bounds
    return nibSceneCreateRestaurant
    
  }
}
