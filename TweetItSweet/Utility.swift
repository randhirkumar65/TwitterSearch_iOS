//
//  Utility.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 18/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation

class Utility: NSObject {
    
    // MARK: Conver Json to Data
    class func jsonToNSData(json: AnyObject) -> NSData? {
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData?
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    // MARK: Format points to million or billion namespace.
    class func formatPoints(num: Double) ->String {
        let thousandNum = num/1000
        let millionNum = num/1000000
        if num >= 1000 && num < 1000000{
            if(floor(thousandNum) == thousandNum){
                return("\(Int(thousandNum))k")
            }
            return("\(thousandNum.rounded(toPlaces: 1))k")
        }
        if num > 1000000 {
            if(floor(millionNum) == millionNum){
                return("\(Int(thousandNum))k")
            }
            return ("\(millionNum.rounded(toPlaces: 1))M")
        }
        else{
            if(floor(num) == num){
                return ("\(Int(num))")
            }
            return ("\(num)")
        }
        
    }
}
