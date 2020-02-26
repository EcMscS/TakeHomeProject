//
//  UserAuth.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct UserAuth: Codable {
	var userID: String = ""
	var authToken: String = ""
	
	enum CodingKeys: String, CodingKey {
		case userID = "user_id"
		case authToken = "auth_token"
	}
}
