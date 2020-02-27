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
	
}
