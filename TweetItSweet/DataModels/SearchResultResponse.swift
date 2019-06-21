//
//  SearchResultResponse.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//


import Foundation

struct SearchResultResponse : Codable {
	let lang : String?
	let text : String?
	let favorite_count : Double?
	let retweet_count : Double?
	let id : Double?
	let user : User?
	let created_at : String?
}
