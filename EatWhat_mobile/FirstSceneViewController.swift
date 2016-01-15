//
//  FirstSceneViewController.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit

class FirstSceneViewController: UIViewController {

  @IBOutlet weak var btnCreateNewRestaurant: UIButton!
  @IBOutlet weak var btnShowNewRestaurant: UIButton!
  @IBOutlet weak var btnDecideRestaurantForMeal: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  
  @IBAction func btnFunctionCreateNewRestaurant(sender: AnyObject) {
    print("create")
  }
  @IBAction func btnFunctionShowNewRestaurant(sender: AnyObject) {
    print("show")
    
  }
  @IBAction func btnFunctionDecideRestaurantForMeal(sender: AnyObject) {
    print("decide")
    
  }
  
}
