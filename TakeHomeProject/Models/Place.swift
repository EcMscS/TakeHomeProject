//
//  Place.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct Place: Codable {
	var distanceInMiles: Double? = 0
	var name: String? = ""
	var openNow: Bool? = false
	
	enum CodingKeys: String, CodingKey {
		case distanceInMiles = "distance_miles"
		case name
		case openNow
	}
}
