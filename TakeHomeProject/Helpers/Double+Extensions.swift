//
//  Double+Extensions.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/27/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
	
	func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
