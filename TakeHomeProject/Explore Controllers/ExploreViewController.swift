//
//  ExploreViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/24/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit
import CachyKit

class ExploreViewController: UIViewController {

	let cachy = CachyLoader()
	var exploreViewPreviewListItems: [PreviewListItem] = []
	
	@IBOutlet weak var cardCollectionView: UICollectionView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		cardCollectionView.delegate = self
		cardCollectionView.dataSource = self
		
		setupNavBarLogo()
		populateData()
    }
    
	fileprivate func populateData() {
		
		Network.fetchPreviewListDataWithCache(cachyInstance: cachy) { (previewListData) in
			self.exploreViewPreviewListItems = previewListData
			DispatchQueue.main.async {
				self.cardCollectionView.reloadData()
			}
		}
	}
	
	fileprivate func setupNavBarLogo() {
		let logo = UIImage(named: "takeHomeProjectLogo.pdf")
		let imageView = UIImageView(image: logo)
		self.navigationItem.titleView = imageView
	}

}


extension ExploreViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return exploreViewPreviewListItems.count
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let storyboard = UIStoryboard(name: "ExploreItemDetails", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "toExploreItemDetails")
		//vc.modalPresentationStyle = .fullScreen
		//vc.modalTransitionStyle = .crossDissolve
		present(vc, animated: true, completion: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCardCell", for: indexPath) as? ExplorePreviewCardCollectionViewCell else {
			print("Error with collection cell init")
			return UICollectionViewCell()
		}
		cell.cardViewWidthConstraintOutlet.constant = cardCollectionView.frame.size.width - 20
		
		let data = exploreViewPreviewListItems[indexPath.row]
		cell.loadLabelData(withModelData: data)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width = cardCollectionView.frame.size.width - 20
		
		return CGSize(width: width, height: 194)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}
	
	
}
