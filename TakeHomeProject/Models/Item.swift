//
//  Item.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct Item: Codable {
	var category: String
	var deliveryServices: [DeliveryService]
	var description: String
	var id: String
	var images: [ItemImage]
	var name: String
	var price: Float
	var score: Score
}

struct ItemImage: Codable {
	var credits: String
	var url: String
}
