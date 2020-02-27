//
//  ExploreItemDeliveryProviderTableViewCell.swift
//  
//
//  Created by Arin Davoodian on 2/27/20.
//

import UIKit

class ExploreItemDeliveryProviderTableViewCell: UITableViewCell {

	@IBOutlet weak var providerNameLabel: UILabel!
	@IBOutlet weak var providerETAandPriceLabel: UILabel!
	@IBOutlet weak var providerQualitiesLabel: UILabel!
	@IBOutlet weak var providerMinOrderLabel: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		DispatchQueue.main.async {
			self.providerNameLabel.font = UIFont.sectionHeader
			self.providerETAandPriceLabel.font = UIFont.sectionHeader
			self.providerQualitiesLabel.font = UIFont.guidanceText
			self.providerMinOrderLabel.font = UIFont.guidanceText
		}
    }
	
	func loadProviderDetails(withData data: DeliveryService) {
		if let providerName = data.name {
			self.providerNameLabel.text = providerName
		}
		guard let min = data.eta?.min, let max = data.eta?.max, let fee = data.fee else {
				print("provider fee, min, max not available")
				return
		}
		self.providerETAandPriceLabel.text = "\(min) - \(max) min, $\(fee) fee"
		
		self.providerQualitiesLabel.text = "No Qualities Available"
		
		if let minOrder = data.minimumOrder {
			self.providerMinOrderLabel.text = "$\(minOrder) order minimum"
		}
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
