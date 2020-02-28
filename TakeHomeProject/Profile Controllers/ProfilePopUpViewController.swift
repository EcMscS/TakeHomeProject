//
//  ProfilePopUpViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/26/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ProfilePopUpViewController: UIViewController {
	
	@IBOutlet weak var cellPhoneTextField: UITextField!
	@IBOutlet weak var descriptionTextLabel: UIView!
	@IBOutlet weak var createAccountButtonOutlet: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupCellPhoneTextField()
		hideKeyboardWhenTappedAround()
		
	}
	
	@IBAction func createAccountTapped(_ sender: UIButton) {
		self.view.endEditing(true)
		
		if let cellPhoneNumber = cellPhoneTextField.text {
			if cellPhoneNumber != "" {
				
				if validateForPhoneNumber(value: cellPhoneNumber) {
					
					Network.createAccount(cellPhoneNumber: cellPhoneNumber) { (userAuthData) in
						print(userAuthData.authToken)
						Keychain.saveToKeychain(stringValue: userAuthData.userID, forKey: Keychain.UserAuthData.userID)
						Keychain.saveToKeychain(stringValue: userAuthData.authToken, forKey: Keychain.UserAuthData.authToken)
						DispatchQueue.main.async {
							self.dismiss(animated: true, completion: nil)
						}
					}
					
				} else {
					print("Not a valid phone number")
				}
			} else {
				print("Please enter phone number")
			}
		}
	}
	
	fileprivate func setupCellPhoneTextField() {
		cellPhoneTextField.addLine(position: .lineAtBottom, color: .white, width: 2)
	}
	
	func validateForPhoneNumber(value: String) -> Bool {
		let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
		let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
		let result =  phoneNumberTest.evaluate(with: value)
		return result
	}
	
}
