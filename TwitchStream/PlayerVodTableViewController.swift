//
//  PlayerVodTableViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 19/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerVodTableViewController: UITableViewController {
  
  static func present(from viewController: UIViewController, withPlayer player: Player) {
    
    if let playerVodTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerVodTableViewController") as? PlayerVodTableViewController {
      viewController.present(playerVodTableViewController, animated: true, completion: nil)
      
    }
  }
}
