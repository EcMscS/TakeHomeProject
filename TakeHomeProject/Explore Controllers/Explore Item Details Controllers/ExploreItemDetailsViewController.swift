//
//  ExploreItemDetailsViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/26/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit

class ExploreItemDetailsViewController: UIViewController {

	
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}

extension ExploreItemDetailsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		return UITableViewCell()
	}
	
	
}
