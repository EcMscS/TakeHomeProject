//
//  Keychain.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/26/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation
import KeychainSwift

class Keychain {
	
	struct UserAuthData {
		static let userID = "com.userID.TakeHomeProject"
		static let authToken = "com.authToken.TakeHomeProject"
	}
	
	static func saveToKeychain(stringValue: String, forKey: String) {
		let keychain = KeychainSwift()
		keychain.set(stringValue, forKey: forKey, withAccess: .accessibleWhenUnlocked)
	}
	
	static func retieveFromKeychain(forKey key: String) -> String? {
		let keychain = KeychainSwift()
		if let keyData = keychain.get(key) {
			return keyData
		}
		return nil
	}
	
	static func removeFromKeychain(forKey key: String) {
		let keychain = KeychainSwift()
		keychain.delete(key)
	}
	
	static func clearKeychain() {
		let keychain = KeychainSwift()
		keychain.clear()
	}
	
}
