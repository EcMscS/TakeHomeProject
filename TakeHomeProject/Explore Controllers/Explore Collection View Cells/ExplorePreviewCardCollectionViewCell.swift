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
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)
		
		DispatchQueue.main.async {
			self.itemTitleLabel.font = UIFont.largeTitle
		}
	}
	
}
