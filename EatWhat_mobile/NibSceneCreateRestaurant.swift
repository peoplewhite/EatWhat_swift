//
//  NibSceneCreateRestaurant.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit

class NibSceneCreateRestaurant: UIView {

  @IBOutlet weak var textfieldRestaurantName: UITextField!
  @IBOutlet weak var textfieldRestaurantAddress: UITextField!
  @IBOutlet weak var btnCancelToCreate: UIButton!
  @IBOutlet weak var btnConfirmToCreate: UIButton!
  
  
  override func awakeFromNib() {
    
  }
  
  @IBAction func btnFunctionExit(sender: AnyObject) {
    
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
