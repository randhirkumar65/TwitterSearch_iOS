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
let kTwitterAPISecretKey = "C4nSb5vmSL5ozjCApbuKFhvHbsohEzem8aqsNY2LLhik6AhHda"
let kTwitterAppID = "16550081"
let kConsumerKey = "8S7THedqrDaiMuSt2oyNdLuux"
let kConsumerSecretKey = "bwU0YGPmzvxy8Xf1IVdDvJkaH3mEJN7yTaxM5AlQKsrcwceSiH"
let kAccessToken = "1140325335755452416-Eq3KnExJd31ZNCunE8OW8biajT2r96"
let kAccessSecretToken = "n5ML7HLamhzIAQBL4ZzjlKt32G9L9FW0xOWHBMXWDzSjj"

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
