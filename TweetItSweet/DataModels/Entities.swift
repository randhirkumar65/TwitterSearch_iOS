//
//  Entities.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation

struct Entities : Codable {
	let url : Url?
	let description : Description?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(Url.self, forKey: .url)
		description = try values.decodeIfPresent(Description.self, forKey: .description)
	}

}
