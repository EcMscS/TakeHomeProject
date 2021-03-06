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
	
	var selectedCell: ExplorePreviewCardCollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
	var animator: Animator?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		cardCollectionView.delegate = self
		cardCollectionView.dataSource = self
		
		setupNavBarLogo()
		populateData()
    }
	
	func presentSecondViewController(with data: PreviewListItem) {
		let secondViewController = UIStoryboard(name: "ExploreItemDetails", bundle: nil).instantiateViewController(withIdentifier: "toExploreItemDetails") as! ExploreItemDetailsViewController
		
		// 4
		secondViewController.transitioningDelegate = self
		
		secondViewController.modalPresentationStyle = .fullScreen
		secondViewController.itemID = data.id
		present(secondViewController, animated: true)
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
//		let storyboard = UIStoryboard(name: "ExploreItemDetails", bundle: nil)
//		let vc = storyboard.instantiateViewController(withIdentifier: "toExploreItemDetails") as! ExploreItemDetailsViewController
//		vc.modalPresentationStyle = .fullScreen
//		if let itemID = self.exploreViewPreviewListItems[indexPath.row].id {
//			vc.itemID = itemID
//		} else {
//			return
//		}
//
//		present(vc, animated: true, completion: nil)
		
		selectedCell = collectionView.cellForItem(at: indexPath) as? ExplorePreviewCardCollectionViewCell
        // 7
		selectedCellImageViewSnapshot = selectedCell?.snapshotView(afterScreenUpdates: false)
        
		presentSecondViewController(with: self.exploreViewPreviewListItems[indexPath.row])
		
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCardCell", for: indexPath) as? ExplorePreviewCardCollectionViewCell else {
			print("Error with collection cell init")
			return UICollectionViewCell()
		}
		cell.cardViewWidthConstraintOutlet.constant = cardCollectionView.frame.size.width - 30
		
		let data = exploreViewPreviewListItems[indexPath.row]
		cell.loadLabelData(withModelData: data)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width = cardCollectionView.frame.size.width - 30
		
		return CGSize(width: width, height: 194)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
	}
	
	
}

extension ExploreViewController: UIViewControllerTransitioningDelegate {
	
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		
		guard let firstViewController = ((presenting as! UITabBarController).viewControllers?.first as! UINavigationController).viewControllers.first as? ExploreViewController,
            let secondViewController = presented as? ExploreItemDetailsViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
            else {
				print("returned nil on vc transition presenting")
				return nil
		}

        animator = Animator(type: .present, firstViewController: firstViewController, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }

    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let secondViewController = dismissed as? ExploreItemDetailsViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
            else { return nil }

        animator = Animator(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
	
}
