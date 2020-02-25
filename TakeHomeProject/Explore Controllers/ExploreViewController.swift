//
//  ExploreViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/24/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

	@IBOutlet weak var cardCollectionView: UICollectionView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		cardCollectionView.delegate = self
		cardCollectionView.dataSource = self
    }
    

}


extension ExploreViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCardCell", for: indexPath) as? ExplorePreviewCardCollectionViewCell else {
			print("Error with collection cell init")
			return UICollectionViewCell()
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width = cardCollectionView.frame.size.width - 20
		
		return CGSize(width: width, height: 192)
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
