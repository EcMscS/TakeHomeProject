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
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		DispatchQueue.main.async {
			self.itemNameLabel.font = UIFont.largeTitle
			self.itemPriceLabel.font = UIFont.price
			self.itemDescriptionLabel.font = UIFont.subTitle
			self.itemMatchPercentageLabel.font = UIFont.guidanceText
		}
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
