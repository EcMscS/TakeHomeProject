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
	
	override func viewDidLoad() {
        super.viewDidLoad()

       cellPhoneTextField.addLine(position: .lineAtBottom, color: .white, width: 2)
    }
    


}
