//
//  Item.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct Item: Codable {
	var category: String? = ""
	var deliveryServices = [DeliveryService]()
	var description: String? = ""
	var id: String? = ""
	var images = [ItemImage]()
	var name: String? = ""
	var price: Double? = 0
	var score: Score?
	
	enum CodingKeys: String, CodingKey {
		case category
		case deliveryServices = "delivery_services"
		case description
		case id
		case images
		case name
		case price
		case score
	}
}

struct ItemImage: Codable {
	var credits: String? = ""
	var url: String? = ""
}
