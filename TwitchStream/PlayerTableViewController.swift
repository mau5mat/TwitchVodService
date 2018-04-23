//
//  PlayerTableViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 19/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
  
  private var players = [Player]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadPlayers()
  }
  
  
  static func present(from viewController: UIViewController) {
    
    if let playerTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerTableViewController") as? PlayerTableViewController {
      viewController.present(playerTableViewController, animated: true, completion: nil)
      
    }
  }
  
  private func loadPlayers() {
    
    // Loading the flag images
    let flag1 = UIImage(named: "ukFlag")
    let flag2 = UIImage(named: "swedenFlag")
    let flag3 = UIImage(named:"germanFlag")
    let flag4 = UIImage(named: "koreanFlag")
    let flag5 = UIImage(named: "philipinoFlag")
    
    // Creating player objects
    guard let player1 = Player(flag: flag4!, name: "Devil Piggy Jin", twitch: "https://www.twitch.tv/sslaeppa") else {
      fatalError("Unable to instantiate player1")
    }
    
    guard let player2 = Player(flag: flag2!, name: "Cyrox", twitch: "https://www.twitch.tv/cyrox") else {
      fatalError("Unable to instantiate player2")
    }
    
    guard let player3 = Player(flag: flag4!, name: "Qudans", twitch: "https://www.twitch.tv/qudans1987") else {
      fatalError("Unable to instantiate player3")
    }
    
    guard let player4 = Player(flag: flag4!, name: "tkfightspirit", twitch: "https://www.twitch.tv/tkfightspirit") else {
      fatalError("Unable to instantiate player4")
    }
    
    guard let player5 = Player(flag: flag1!, name: "MrKhan", twitch: "https://www.twitch.tv/mrkhan_") else {
      fatalError("Unable to instantiate player5")
    }
    
    guard let player6 = Player(flag: flag5!, name: "El", twitch: "https://www.twitch.tv/dvj_el") else {
      fatalError("Unable to instantiate player6")
    }
    
    guard let player7 = Player(flag: flag3!, name: "LegendaryMihawk", twitch: "https://www.twitch.tv/legendarymihawk") else {
      fatalError("Unable to instantiate player7")
    }
    
    players += [player1, player2, player3, player4, player5, player6, player7]
  }
}
