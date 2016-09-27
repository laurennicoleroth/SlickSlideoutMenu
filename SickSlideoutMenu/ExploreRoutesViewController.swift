//
//  ExploreRoutesViewController.swift
//  SickSlideoutMenu
//
//  Created by Lauren Nicole Roth on 9/27/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit

class ExploreRoutesViewController: UIViewController, FilterMenuTransitionManagerDelegate {
  
    let filterTransitionManager = FilterMenuTransitionManager()

    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.title = "Explore"
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      
    }
  
    func dismiss() {
      dismiss(animated: true, completion: nil)
    }
  
    
    
}
