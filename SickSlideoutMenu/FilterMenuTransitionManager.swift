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
        let tapGestureRecognizer = UITapGestureRecognizer(target: delegate, action: Selector(("dismiss")))
        snapshot?.addGestureRecognizer(tapGestureRecognizer)
      }
    }
  }
  
  var delegate : FilterMenuTransitionManagerDelegate?
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    //Set fromView, toView, and container for transitionContext
    let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
    let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
    let container = transitionContext.containerView
    
    let moveDown = CGAffineTransform(translationX: 0, y: container.frame.height - 150)
    let moveUp = CGAffineTransform(translationX: 0, y: -50)
    
    if isPresenting {
      toView?.transform = moveUp
      snapshot = fromView?.snapshotView(afterScreenUpdates: true)
      container.addSubview(toView!)
      container.addSubview(snapshot!)
    }
    
    UIView.animate(withDuration: 0.5, delay: 0.3, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
      
      if self.isPresenting {
        self.snapshot?.transform = moveDown
        toView?.transform = CGAffineTransform.identity
      } else {
        self.snapshot?.transform = moveUp
        toView?.transform = CGAffineTransform.identity
      }
      
      }, completion: { finished in
        
          transitionContext.completeTransition(true)
        
        if !self.isPresenting {
          self.snapshot?.removeFromSuperview()
        }
    })
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = true
    return self
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    isPresenting = false
    return self
  }

}
