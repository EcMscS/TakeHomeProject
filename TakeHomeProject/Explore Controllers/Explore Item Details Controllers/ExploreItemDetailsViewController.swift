//
//  ExploreItemDetailsViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/26/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit
import CachyKit

class ExploreItemDetailsViewController: UIViewController {
	
	var itemID: String?
	var itemData: Item?
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var itemImageAttributionLabel: UILabel!
	
	let cachy = CachyLoader()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self
		
		populateData()
        
    }
	
	fileprivate func populateData() {
		if let itemID = itemID {
			Network.fetchItemDetailsWithCache(cachyInstance: cachy, itemID: itemID) { (itemData) in
				self.itemData = itemData
				
				self.loadHeaderItemViewImage(withURL: itemData.images[0].url!, withAttribution: itemData.images[0].credits!)
				
				self.tableView.reloadData()
			}
		} else {
			print("No Item ID Data")
		}
	}
	
	fileprivate func loadHeaderItemViewImage(withURL url: String, withAttribution attribution: String) {
		guard let imageURL = URL(string: url) else { return }
		
		self.itemImageView.cachyImageLoad(imageURL, isShowLoading: true) { (image, url) in
			print("image loaded")
		}
		
		self.itemImageAttributionLabel.text = attribution
	}
    
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	@IBAction func dismissViewTapped(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
}

extension ExploreItemDetailsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let itemDataCount = self.itemData?.deliveryServices.count {
			return itemDataCount + 1
		} else {
			return 0 + 1
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemDetail", for: indexPath) as? ExploreItemDetailTableViewCell else { return UITableViewCell() }
			if let itemDetails = self.itemData {
				cell.loadItemDetails(fromModal: itemDetails)
			}
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemDeliveryProvider", for: indexPath) as? ExploreItemDeliveryProviderTableViewCell else { return UITableViewCell() }
			if let providerDetails = itemData?.deliveryServices[indexPath.row - 1] {
				cell.loadProviderDetails(withData: providerDetails)
			}
			return cell
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return 175
		} else {
			return 81
		}
	}
	
	
}

