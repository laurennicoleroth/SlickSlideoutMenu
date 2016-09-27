//
//  FilterMenuTransitionManager.swift
//  SickSlideoutMenu
//
//  Created by Lauren Nicole Roth on 9/27/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import UIKit

protocol FilterMenuTransitionManagerDelegate {
  func dismiss()
}

class FilterMenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
  
  let duration = 0.5
  var isPresenting = false
  
  var snapshot : UIView? {
    didSet {
      if let delegate = delegate {
        let tapGestureRecognizer = UITapGestureRecognizer(target: delegate, action: "dismiss")
        snapshot?.addGestureRecognizer(tapGestureRecognizer)
      }
    }
  }
  
  var delegate : FilterMenuTransitionManagerDelegate?
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
    let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
    
    
   let container = transitionContext.containerView
    
  }
    
   
}
