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

		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		checkIfCurrentlyAuthorized()
	}
	
	@IBAction func clearAuthStateTapped(_ sender: UIButton) {
		Keychain.clearKeychain()
		checkIfCurrentlyAuthorized()
	}
	
	fileprivate func checkIfCurrentlyAuthorized() {
		if let authTokenFromKeychainIsAuthorized = Keychain.retieveFromKeychain(forKey: Keychain.UserAuthData.authToken) {
			print(authTokenFromKeychainIsAuthorized)
		} else {
			DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
				self.displayAuthScreen()
			}
		}
	}
    
	func displayAuthScreen() {
		let storyboard = UIStoryboard(name: "Profile", bundle: nil)
		guard let vc = storyboard.instantiateViewController(withIdentifier: "profilePopUp") as? ProfilePopUpViewController else { return }
		vc.modalPresentationStyle = .overFullScreen
		vc.modalTransitionStyle = .crossDissolve
		present(vc, animated: true, completion: nil)
	}
}
