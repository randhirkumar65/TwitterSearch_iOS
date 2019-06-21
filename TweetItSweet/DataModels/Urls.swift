//
//  Urls.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation

struct Urls : Codable {
	let indices : [Double]?
	let display_url : String?
	let expanded_url : String?
	let url : String?

	enum CodingKeys: String, CodingKey {

		case indices = "indices"
		case display_url = "display_url"
		case expanded_url = "expanded_url"
		case url = "url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		indices = try values.decodeIfPresent([Double].self, forKey: .indices)
		display_url = try values.decodeIfPresent(String.self, forKey: .display_url)
		expanded_url = try values.decodeIfPresent(String.self, forKey: .expanded_url)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
