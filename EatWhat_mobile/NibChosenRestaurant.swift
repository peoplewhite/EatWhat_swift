//
//  NibChosenRestaurant.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/27.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit

class NibChosenRestaurant: UIView {

  @IBOutlet weak var labRestaurantName: UILabel!
  @IBOutlet weak var labRestaurantAddress: UILabel!

  @IBAction func btnFunctionExit(sender: UIButton) {
    removeFromSuperview()
  }
}
