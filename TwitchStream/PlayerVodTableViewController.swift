//
//  PlayerVodTableViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 19/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerVodTableViewController: UITableViewController {
  
  var player: Player?
  private let webService = TwitchWebService()

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let player = self.player {
      self.webService.requestPlayerVOD(withPlayer: player)
    }
  }
  
  static func push(from navigationController: UINavigationController, withPlayer player: Player) {
    
    if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerVodTableViewController") as? PlayerVodTableViewController {
      viewController.player = player
      navigationController.pushViewController(viewController, animated: true)
    }
  }
}
