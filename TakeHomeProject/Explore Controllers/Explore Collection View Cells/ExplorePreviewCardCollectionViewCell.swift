//
//  ExplorePreviewCardCollectionViewCell.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/24/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ExplorePreviewCardCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var cardViewWidthConstraintOutlet: NSLayoutConstraint!
	
	@IBOutlet weak var itemTitleLabel: UILabel!
	@IBOutlet weak var itemPriceLabel: UILabel!
	@IBOutlet weak var itemDescriptionLabel: UILabel!
	@IBOutlet weak var itemPlaceNameLabel: UILabel!
	@IBOutlet weak var itemPlaceStatusLabel: UILabel!
	@IBOutlet weak var itemPlaceDistanceLabel: UILabel!
	@IBOutlet weak var itemCategoryTypeLabel: UILabel!
	@IBOutlet weak var itemMatchPercentageLabel: UILabel!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)

		DispatchQueue.main.async {
			self.itemTitleLabel.font = UIFont.largeTitle
			self.itemPriceLabel.font = UIFont.price
			self.itemDescriptionLabel.font = UIFont.subTitle
			self.itemPlaceNameLabel.font = UIFont.guidanceText
			self.itemPlaceStatusLabel.font = UIFont.guidanceText
			self.itemPlaceDistanceLabel.font = UIFont.guidanceTextLight
			self.itemCategoryTypeLabel.font = UIFont.guidanceTextLight
			self.itemMatchPercentageLabel.font = UIFont.guidanceText
		}
		
	}
	
	func loadLabelData(withModelData model: PreviewListItem) {
		
		
		
		if let itemTitle = model.name {
			self.itemTitleLabel.text = itemTitle
		}
		if let price = model.price {
			self.itemPriceLabel.text = "$\(price)"
		}
		if let description = model.description {
			self.itemDescriptionLabel.text = description
		}
		if let placeName = model.place?.name {
			self.itemPlaceNameLabel.text = placeName
		}
		if let placeStatus = model.place?.openNow {
			placeStatus == true ? (self.itemPlaceStatusLabel.text = "OPEN") : (self.itemPlaceStatusLabel.text = "CLOSED")
		}
		if let distance = model.place?.distanceInMiles {
			self.itemPlaceDistanceLabel.text = "\(distance) mi"
		}
		if let itemCategory = model.category {
			self.itemCategoryTypeLabel.text = itemCategory
		}
		if let matchScore = model.score?.value {
			self.itemMatchPercentageLabel.text = "\(matchScore)% MATCH"
		}
		
	}
	
}
