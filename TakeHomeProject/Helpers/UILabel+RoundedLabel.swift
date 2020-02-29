//
//  UILabel+RoundedLabel.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/29/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class RoundedLabel: UILabel {
	
	@IBInspectable var verticalPad: CGFloat = 0
	@IBInspectable var horizontalPad: CGFloat = 0
	@IBInspectable var cornerRadius: CGFloat = 0
	
	func setup() {
		layer.cornerRadius = cornerRadius
		clipsToBounds = true
		textAlignment = .center
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		setup()
	}
	
	override var intrinsicContentSize: CGSize {
		let superViewSize = super.intrinsicContentSize
		let newWidth = superViewSize.width + superViewSize.height + (1 * horizontalPad)
		let newHeight = superViewSize.height + (1 * verticalPad)
		let newSize = CGSize(width: newWidth, height: newHeight)
		return newSize
	}
	
}
