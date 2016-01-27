//
//  FirstSceneViewController.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit
import Alamofire

class FirstSceneViewController: UIViewController {

  @IBOutlet weak var btnShowNewRestaurant: UIButton!
  @IBOutlet weak var btnDecideRestaurantForMeal: UIButton!
  
  var arrAllRestaurantsData:NSArray = []
  
  var nibSceneShowRestaurant: NibSceneShowRestaurant = NibSceneShowRestaurant()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      callAPIToGetAllRestaurant()

    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  
//  @IBAction func btnFunctionCreateNewRestaurant(sender: AnyObject) {
//    
//    let nibSceneCreateRestaurant: NibSceneCreateRestaurant = NSBundle.mainBundle().loadNibNamed("NibSceneCreateRestaurant", owner: self, options: nil)[0] as! NibSceneCreateRestaurant
//    
//    nibSceneCreateRestaurant.frame = CGRect(
//      x: UIScreen.mainScreen().bounds.width,
//      y: 0,
//      width: UIScreen.mainScreen().bounds.width,
//      height: UIScreen.mainScreen().bounds.height
//    )
//    
//    UIView.animateWithDuration(0.5, animations: {() -> Void in
//      nibSceneCreateRestaurant.frame = UIScreen.mainScreen().bounds
//    })
//    
//    
//    self.view.addSubview(nibSceneCreateRestaurant)
//    
//    
//    
//  }
  @IBAction func btnFunctionShowNewRestaurant(sender: AnyObject) {
    
    nibSceneShowRestaurant = NSBundle.mainBundle().loadNibNamed("NibSceneShowRestaurant", owner: self, options: nil)[0] as! NibSceneShowRestaurant
    
    nibSceneShowRestaurant.frame = CGRect(
      x: UIScreen.mainScreen().bounds.width,
      y: 0,
      width: UIScreen.mainScreen().bounds.width,
      height: UIScreen.mainScreen().bounds.height
    )
    
    UIView.animateWithDuration(0.5, animations: {() -> Void in
      
      self.nibSceneShowRestaurant.frame = UIScreen.mainScreen().bounds
      
      }, completion: {(finished: Bool) -> Void in
        
        self.nibSceneShowRestaurant.setDataSourceForTable(self.arrAllRestaurantsData)
        
    })
    
    self.view.addSubview(nibSceneShowRestaurant)
  }
  @IBAction func btnFunctionDecideRestaurantForMeal(sender: AnyObject) {
    
    showChosenRestaurantScene()

  }
  
  func showChosenRestaurantScene() {
    
    let nibViewChosenRestaurant: NibChosenRestaurant = NSBundle.mainBundle().loadNibNamed("NibChosenRestaurant", owner: self, options: nil)[0] as! NibChosenRestaurant
    nibViewChosenRestaurant.frame = UIScreen.mainScreen().bounds
    nibViewChosenRestaurant.labRestaurantName.text = "123"
    nibViewChosenRestaurant.labRestaurantAddress.text = "456"
    view.addSubview(nibViewChosenRestaurant)
    
  }
  
  func callAPIToGetAllRestaurant() {
    
    let strURL: String = "http://eatwhat-new.dev/restaurants.json"
    
    Alamofire.request(.GET, strURL)
      .responseJSON { response in
        //        print(response.request)  // original URL request
        //        print(response.response) // URL response
        //        print(response.data)     // server data
        //        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
//          print("JSON: \(JSON)")
          self.arrAllRestaurantsData = JSON as! NSArray
          print("data: \(self.arrAllRestaurantsData)")
          
        }
    }
 
  }
  
}
