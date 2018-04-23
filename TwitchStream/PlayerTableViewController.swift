//
//  PlayerTableViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 19/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
  
  static func present(from viewController: UIViewController) {
    
    if let playerTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerTableViewController") as? PlayerTableViewController {
      viewController.present(playerTableViewController, animated: true, completion: nil)
      
    }
  }
}
