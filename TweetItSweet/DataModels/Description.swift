//
//  Description.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
struct Description : Codable {
	let urls : [String]?

	enum CodingKeys: String, CodingKey {

		case urls = "urls"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		urls = try values.decodeIfPresent([String].self, forKey: .urls)
	}

}
