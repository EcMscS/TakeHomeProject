//
//  PreviewListItem.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

struct PreviewListItem: Codable {
	var category: String? = ""
	var description: String? = ""
	var id: String? = ""
	var name: String? = ""
	var place: Place?
	var price: Double? = 0
	var score: Score?
}
