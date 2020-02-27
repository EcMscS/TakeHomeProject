//
//  UIFont+Style.swift
//  Mizo
//
//  Created by Dave Poirier on 2019-10-22.
//  Copyright © 2019 Mizo LLC. All rights reserved.
//

import UIKit

// MARK: - Export from Zeplin
extension UIFont {
    
    class var largeTitle: UIFont {
      return UIFont(name: "ApercuPro-Bold", size: 20.0)!
    }

    class var sectionHeader: UIFont {
      return UIFont(name: "ApercuPro-Bold", size: 16.0)!
    }

    class var title: UIFont {
      return UIFont(name: "ApercuPro-Bold", size: 16.0)!
    }

    class var subTitle: UIFont {
      return UIFont(name: "ApercuPro-Regular", size: 16.0)!
    }
	
	class var guidanceTextLight: UIFont {
      return UIFont(name: "ApercuPro-Regular", size: 12.0)!
    }
    
    class var guidanceText: UIFont {
      return UIFont(name: "ApercuPro-Bold", size: 12.0)!
    }
	
	class var price: UIFont {
		return UIFont(name: "ApercuPro-Mono", size: 18.0)!
	}
}

