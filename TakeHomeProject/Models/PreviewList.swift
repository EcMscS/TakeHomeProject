//
//  PreviewList.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct PreviewList: Codable {
	let category: String
	let description: String
	let id: String
	let name: String
	let place: Place
	let price: Float
	let score: Score
}
