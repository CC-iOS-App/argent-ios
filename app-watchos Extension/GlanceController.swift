//
//  GlanceController.swift
//  app-watchos Extension
//
//  Created by Sinan Ulkuatam on 3/24/16.
//  Copyright © 2016 Sinan Ulkuatam. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import Alamofire
import SwiftyJSON

class GlanceController: WKInterfaceController {

    
    @IBOutlet var balanceLabel: WKInterfaceLabel!
    
    // FIX DRY
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        print("\(applicationContext)")
        dispatch_async(dispatch_get_main_queue(), {
            //update UI here
            // Get data using Alamofire, data passed from login
            // let accountId = applicationContext["account_id"]!.stringValue
            // print(applicationContext["stripe_key"]!)
            
            if let stripeKey = applicationContext["stripe_key"] {
                let headers = [
                    "Authorization": "Bearer " + (stripeKey as! String),
                    "Content-Type": "application/x-www-form-urlencoded"
                ]
                
                Alamofire.request(.GET, Root.stripeApiUrl + "/v1/balance",
                    encoding:.URL,
                    headers: headers)
                    .responseJSON { response in
                        print(response.request) // original URL request
                        print(response.response?.statusCode) // URL response
                        print(response.data) // server data
                        print(response.result) // result of response serialization
                        
                        // go to main view
                        if(response.response?.statusCode == 200) {
                            print("green light")
                        } else {
                            print("red light")
                        }
                        
                        switch response.result {
                        case .Success:
                            if let value = response.result.value {
                                let json = JSON(value)
                                let formatter = NSNumberFormatter()
                                formatter.numberStyle = .CurrencyStyle
                                // formatter.locale = NSLocale.currentLocale() // This is the default
                                let pendingNum = formatter.stringFromNumber(Float(json["pending"][0]["amount"].stringValue)!/100)
                                self.balanceLabel.setText(pendingNum)
                            }
                        case .Failure(let error):
                            print(error)
                        }
                }
            }
        })
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
