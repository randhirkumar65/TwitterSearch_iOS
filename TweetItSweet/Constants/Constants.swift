//
//  Constants.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 16/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
import UIKit

// MARK: API Constants
let kTwitterURL = "https://api.twitter.com/1.1/search/tweets.json"
let kBASE_URL = "https://api.twitter.com/1.1"
#error("Please add your Twitter API and secret key")
let kTwitterAPISecretKey = "@addyourAPISecretKey"
let kTwitterAppID = "@addyourID"
let kConsumerKey = "@addyourCkey"
let kConsumerSecretKey = "@addyourCsecretkey"
let kAccessToken = "addyourAceessToken"
let kAccessSecretToken = "addyourAceessSecretToken"

// MARK: StoryBoard & Cell Identifiers
let kSearchViewController = "TSearchViewController"
let kSearchResultCellIdentifiers = "TSearchTweetTableViewCell"

// MARK: Constants
let kAppThemeColor = UIColor(red: 41 / 255, green: 163 / 255, blue: 239 / 255, alpha: 0.85)

// MARK: Enum Constants
enum ResultType: String {
    case mixed = "mixed"
    case popular = "popular"
    case recent = "recent"
    
    var desc: String {
        return self.rawValue
    }
}

// MARK: DEVICE RELATED STUFF
enum UIUserInterfaceIdiom: Int {
    case Unspecified
    case Phone
    case Pad
}

struct ScreenSize {
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
