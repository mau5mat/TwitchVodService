//
//  SplashViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 20/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
  
  @IBOutlet weak var loadingControl: LoadingControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    loadingControl.fadeInImages(from: self)
    
  }
}
