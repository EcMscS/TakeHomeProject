//
//  DeliveryService.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct DeliveryService: Codable {
	var eta = ETA()
	var fee: Double? = 0
	var minimumOrder: Double? = 0
	var name: String? = ""
	
	enum CodingKeys: String, CodingKey {
		case eta
		case fee
		case minimumOrder = "minimum_order"
		case name
	}
}

struct ETA: Codable {
	var max: Int?
	var min: Int?
}
