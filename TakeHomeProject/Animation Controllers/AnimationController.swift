//
//  AnimationController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/28/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit
import Foundation

class AnimationController: NSObject {
	
	private let animationDuration: Double
	private let animationType: AnimationType
	
	enum AnimationType {
		case present
		case dismiss
	}
	
	init(animationDuration: Double, animationType: AnimationType) {
		self.animationDuration = animationDuration
		self.animationType = animationType
	}
	
	
}

extension AnimationController: UIViewControllerAnimatedTransitioning {
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		
		return TimeInterval(exactly: animationDuration) ?? 2
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		
		guard let toViewController = transitionContext.view(forKey: .to),
			let fromViewController = transitionContext.view(forKey: .from) else {
				transitionContext.completeTransition(false)
				return
		}
		
		switch animationType {
			case .present:
				guard let toView = toViewController.viewWithTag(100) else {
					print("Error with viewWithTag")
					return
				}
				transitionContext.containerView.addSubview(toView)
				presentAnimation(with: transitionContext, viewToAnimate: toView)
			
			case .dismiss:
				guard let toView = toViewController.snapshotView(afterScreenUpdates: true) else {
					print("Error with viewWithTag")
					return
				}
				
				guard let fromView = fromViewController.viewWithTag(100) else {
					print("Error with viewWithTag")
					return
				}
				
				transitionContext.containerView.addSubview(toView)
				transitionContext.containerView.addSubview(fromView)
				dismissAnimation(with: transitionContext, viewToAnimate: fromView)

		}
	}
	
	func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
		let duration = transitionDuration(using: transitionContext)
		let scaleDown = CGAffineTransform(scaleX: 0.3, y: 0.3)
		let moveOut = CGAffineTransform(translationX: -viewToAnimate.frame.width, y: 0)
		
		UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeLinear, animations: {
			
			UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
				viewToAnimate.transform = scaleDown
			}
			
			UIView.addKeyframe(withRelativeStartTime: 3.0/duration, relativeDuration: 0.7) {
				viewToAnimate.transform = scaleDown.concatenating(moveOut)
				viewToAnimate.alpha = 0
			}
			
	 }) { _ in
			transitionContext.completeTransition(true)
		}
	}
	
	func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
		
		viewToAnimate.clipsToBounds = true
		viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
		
		let duration = transitionDuration(using: transitionContext)
		
		UIView.animate(withDuration: duration,
					   delay: 0,
					   usingSpringWithDamping: 0.80,
					   initialSpringVelocity: 0.1,
					   options: .curveEaseInOut, animations: {
					viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}) { _ in
			transitionContext.completeTransition(true)
		}
	}
	
}

