//
//  PlayerTableViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 19/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
  
  // MARK: Properties
  private var players = [Player]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadPlayers()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    <#code#>
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cellIdentifier = "PlayerTableViewCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell else {
      fatalError("The dequeued cell is not an instance of PlayerTableViewCell.")
    }
    
    let player = players[indexPath.row]
    
    cell.set(player: player)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
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
    
    let player1 = Player(flag: flag4, name: "Devil Piggy Jin", twitch: "https://www.twitch.tv/sslaeppa", userID: "40728579")
    let player2 = Player(flag: flag2, name: "Cyrox", twitch: "https://www.twitch.tv/cyrox", userID: "504840")
    let player3 = Player(flag: flag4, name: "Qudans", twitch: "https://www.twitch.tv/qudans1987", userID: "129671338")
    let player4 = Player(flag: flag4, name: "tkfightspirit", twitch: "https://www.twitch.tv/tkfightspirit", userID: "151547196")
    let player5 = Player(flag: flag1, name: "MrKhan", twitch: "https://www.twitch.tv/mrkhan_", userID: "171707568")
    let player6 = Player(flag: flag5!, name: "El", twitch: "https://www.twitch.tv/dvj_el", userID: "154106905")
    let player7 = Player(flag: flag3!, name: "LegendaryMihawk", twitch: "https://www.twitch.tv/legendarymihawk", userID: "55932070")
    
    players += [player1, player2, player3, player4, player5, player6, player7]
  }
}
