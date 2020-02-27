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
				self.tableView.reloadData()
			}
		} else {
			print("No Item ID Data")
		}
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
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemDeliveryProvider", for: indexPath) as? ExploreItemDeliveryProviderTableViewCell else { return UITableViewCell() }
			return cell
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return 156
		} else {
			return 81
		}
	}
	
	
}
