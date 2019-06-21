//
//  User.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation

struct User : Codable {
	let created_at : String?
	let favourites_count : Double?
	let screen_name : String?
	let profile_image_url : String?
	let name : String?
	let profile_background_image_url_https : String?
	let description : String?
	let lang : String?
	let profile_use_background_image : Bool?
	let id : Double?
	let url : String?
	let default_profile_image : Bool?
	let profile_background_image_url : String?

	enum CodingKeys: String, CodingKey {

		case created_at = "created_at"
		case favourites_count = "favourites_count"
		case screen_name = "screen_name"
		case profile_image_url = "profile_image_url"
		case name = "name"
		case profile_background_image_url_https = "profile_background_image_url_https"
		case description = "description"
		case lang = "lang"
		case profile_use_background_image = "profile_use_background_image"
		case id = "id"
		case url = "url"
		case default_profile_image = "default_profile_image"
		case profile_background_image_url = "profile_background_image_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		favourites_count = try values.decodeIfPresent(Double.self, forKey: .favourites_count)
		screen_name = try values.decodeIfPresent(String.self, forKey: .screen_name)
		profile_image_url = try values.decodeIfPresent(String.self, forKey: .profile_image_url)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		profile_background_image_url_https = try values.decodeIfPresent(String.self, forKey: .profile_background_image_url_https)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		lang = try values.decodeIfPresent(String.self, forKey: .lang)
		profile_use_background_image = try values.decodeIfPresent(Bool.self, forKey: .profile_use_background_image)
		id = try values.decodeIfPresent(Double.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		default_profile_image = try values.decodeIfPresent(Bool.self, forKey: .default_profile_image)
		profile_background_image_url = try values.decodeIfPresent(String.self, forKey: .profile_background_image_url)
	}

}
