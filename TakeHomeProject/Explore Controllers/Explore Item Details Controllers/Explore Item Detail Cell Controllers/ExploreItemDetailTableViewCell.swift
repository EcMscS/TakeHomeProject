//
//  ExploreItemDetailTableViewCell.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/27/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ExploreItemDetailTableViewCell: UITableViewCell {

	@IBOutlet weak var itemNameLabel: UILabel!
	@IBOutlet weak var itemPriceLabel: UILabel!
	@IBOutlet weak var itemDescriptionLabel: UILabel!
	@IBOutlet weak var itemMatchPercentageLabel: UILabel!
	
	@IBOutlet weak var availableOnLabelOutlet: UILabel!
	@IBOutlet weak var matchStarOutlet: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		self.itemNameLabel.font = UIFont.largeTitle
		self.itemPriceLabel.font = UIFont.price
		self.itemDescriptionLabel.font = UIFont.subTitle
		self.itemMatchPercentageLabel.font = UIFont.guidanceText
		self.availableOnLabelOutlet.font = UIFont.sectionHeader
		
    }
	
	func loadItemDetails(fromModal data: Item) {
		if let itemName = data.name {
			self.itemNameLabel.text = itemName
		}
		if let itemPrice = data.price {
			self.itemPriceLabel.text = "$\(itemPrice)"
		}
		if let itemDescription = data.description {
			self.itemDescriptionLabel.text = itemDescription
		}
		if let itemMatchPercentage = data.score?.value {
			self.itemMatchPercentageLabel.text = "\(itemMatchPercentage.removeZerosFromEnd())% MATCH"
		} else {
			self.itemMatchPercentageLabel.text = "UNKNOWN MATCH"
			self.itemMatchPercentageLabel.textColor = .lightGray
			self.matchStarOutlet.tintColor = .lightGray
			
		}
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
