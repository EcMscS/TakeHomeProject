//
//  ProfileViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	
    override func viewDidLoad() {
        super.viewDidLoad()

		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
			self.checkAuthStatus()
		}
		
    }
    
	func checkAuthStatus() {
		let storyboard = UIStoryboard(name: "Profile", bundle: nil)
		guard let vc = storyboard.instantiateViewController(withIdentifier: "profilePopUp") as? ProfilePopUpViewController else { return }
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		present(vc, animated: true, completion: nil)
	}
}
