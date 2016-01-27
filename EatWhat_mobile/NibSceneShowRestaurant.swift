//
//  NibSceneShowRestaurant.swift
//  EatWhat_mobile
//
//  Created by sean on 2016/1/15.
//  Copyright © 2016年 odd. All rights reserved.
//

import UIKit
import Alamofire

class NibSceneShowRestaurant: UIView, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var arrAllRestaurantsData:NSArray = []
  let kCellIdentifier:String = "NibCellRestaurant";
  
  override func awakeFromNib() {
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerNib(UINib(nibName: kCellIdentifier, bundle: nil), forCellReuseIdentifier: kCellIdentifier)
    tableView.tableFooterView = UIView()
    
    

    
    
    let strURL: String = "http://eatwhat-new.dev/restaurants.json"
    
    Alamofire.request(.GET, strURL)
      .responseJSON { response in
//        print(response.request)  // original URL request
//        print(response.response) // URL response
//        print(response.data)     // server data
//        print(response.result)   // result of response serialization
        
        if let JSON = response.result.value {
          print("JSON: \(JSON)")
          self.arrAllRestaurantsData = JSON as! NSArray
          
          self.tableView.reloadData()
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
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrAllRestaurantsData.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    
    var cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as? NibCellRestaurant
    if cell == nil {
      tableView.registerNib(UINib(nibName: kCellIdentifier, bundle: nil), forCellReuseIdentifier: kCellIdentifier)
      cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as? NibCellRestaurant
    }
    
//    if let strRestaurantName = arrAllRestaurantsData[indexPath.row]["name"] {
//    
//      cell?.labName.text = strRestaurantName as? String
//      
//    }
    
    cell?.labName.text    = arrAllRestaurantsData[indexPath.row]["name"] as? String
    cell?.labAddress.text = arrAllRestaurantsData[indexPath.row]["address"] as? String
    
    
    
    return cell!
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 80.0
  }


}
