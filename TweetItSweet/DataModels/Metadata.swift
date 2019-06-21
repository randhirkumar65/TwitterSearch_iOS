//
//  Metadata.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//


import Foundation
struct Metadata : Codable {
	let iso_language_code : String?
	let result_type : String?

	enum CodingKeys: String, CodingKey {

		case iso_language_code = "iso_language_code"
		case result_type = "result_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		iso_language_code = try values.decodeIfPresent(String.self, forKey: .iso_language_code)
		result_type = try values.decodeIfPresent(String.self, forKey: .result_type)
	}

}
