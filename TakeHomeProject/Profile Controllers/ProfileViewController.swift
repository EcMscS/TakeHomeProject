//
//  ProfileViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	
	@IBOutlet weak var cellPhoneTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		cellPhoneTextField.addLine(position: .lineAtBottom, color: .white, width: 2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
