//
//  TweetSearchViewModel.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
import UIKit
import SwifteriOS

class TweetSearchViewModel {
    
    var searchResultDataReceivedClousure: (() -> Void) = { }
    private var searchResultArray = [SearchResultResponse]() {
        didSet {
            searchResultDataReceivedClousure()
        }
    }
    
    // MARK: search tweets with its query text and result type.
    func searchTweets(queryText: String, result_type: ResultType, count: Int) {
        let swifter = Swifter(consumerKey: kConsumerKey, consumerSecret: kConsumerSecretKey, oauthToken: kAccessToken, oauthTokenSecret: kAccessSecretToken)
        swifter.searchTweet(using: queryText, resultType: result_type.desc, count: count, success: { (data, response) in
            print(data)
            let stringJson = String(describing: data)
            
            guard let jsonData = stringJson.data(using: .utf8) else {
                print("Unable to get JSonData")
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode([SearchResultResponse].self, from: jsonData)
                self.searchResultArray = apiResponse
            } catch {
                print("Unable to decode")
            }
            
        }) { (error) in
            print(error)
        }
    }
    
    // MARK: Number of cell items
    func numberOfItem() -> Int {
        var count = 0
        if searchResultArray.count > 0 {
            count = searchResultArray.count
        }
        return count
    }
    
    // MARK: Return Tweets searched data at each cell
    func getTweetsData(atIndex: Int?) -> SearchResultResponse? {
        guard searchResultArray.count > 0, let index = atIndex, index < searchResultArray.count else {
            return nil
        }
        return searchResultArray[index]
    }
}
