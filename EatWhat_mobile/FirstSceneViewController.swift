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
    
//    showChosenRestaurantScene()
//    pickRestaurantByRandom()
    pickRestaurantByCallAPI()

  }
  
  func pickRestaurantByRandom() {
    
    let diceRoll = Int(arc4random_uniform(UInt32(arrAllRestaurantsData.count)))
    
    showChosenRestaurantScene(diceRoll)
    
  }
  
  func pickRestaurantByCallAPI() {
    
    //    let strURL: String = "http://eatwhat-new.dev/restaurants.json"
    let strURL: String = "http://192.168.0.101:3000/get_random_restaurant.json"
    Alamofire.request(.GET, strURL)
      .responseJSON { response in
        //        print(response.request)  // original URL request
        //        print(response.response) // URL response
        //        print(response.data)     // server data
        //        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
                    print("JSON: \(JSON)")
//          self.arrAllRestaurantsData = JSON as! NSArray
//          print("data: \(self.arrAllRestaurantsData)")
          let arrTemp:NSArray = JSON as! NSArray
          self.showChosenRestaurantSceneWithData(arrTemp[0] as! Dictionary)
          
        }
    }
  }
  
  func showChosenRestaurantScene(numRandom: Int) {
    
    let nibViewChosenRestaurant: NibChosenRestaurant = NSBundle.mainBundle().loadNibNamed("NibChosenRestaurant", owner: self, options: nil)[0] as! NibChosenRestaurant
    nibViewChosenRestaurant.frame = UIScreen.mainScreen().bounds
    nibViewChosenRestaurant.labRestaurantName.text = "\"\(arrAllRestaurantsData[numRandom]["name"] as! String)\""
    
    nibViewChosenRestaurant.labRestaurantAddress.text = arrAllRestaurantsData[numRandom]["address"] as? String
    view.addSubview(nibViewChosenRestaurant)
    
  }
  
  func showChosenRestaurantSceneWithData(dictChosenRestaurant: Dictionary<String, AnyObject>) {
    
    let nibViewChosenRestaurant: NibChosenRestaurant = NSBundle.mainBundle().loadNibNamed("NibChosenRestaurant", owner: self, options: nil)[0] as! NibChosenRestaurant
    nibViewChosenRestaurant.frame = UIScreen.mainScreen().bounds
    nibViewChosenRestaurant.labRestaurantName.text = "\"\(dictChosenRestaurant["name"] as! String)\""
   dictChosenRestaurant
    nibViewChosenRestaurant.labRestaurantAddress.text = dictChosenRestaurant["address"] as? String
    view.addSubview(nibViewChosenRestaurant)
    
  }
  
  func callAPIToGetAllRestaurant() {
    
//    let strURL: String = "http://eatwhat-new.dev/restaurants.json"
    let strURL: String = "http://192.168.0.101:3000/restaurants.json"
    
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
