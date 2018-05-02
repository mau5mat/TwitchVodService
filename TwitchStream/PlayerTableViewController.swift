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
  
  static func present(from viewController: UIViewController) {
    
    if let playerNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerTableNavigationController") as? UINavigationController {
      viewController.present(playerNavigationController, animated: true, completion: nil)
      
    }
  }
  
  
  private func loadPlayers() {
    
    // Loading the flag images
    let flag1 = UIImage(named: "ukFlag")
    let flag2 = UIImage(named: "swedenFlag")
    let flag3 = UIImage(named:"germanFlag")
    let flag4 = UIImage(named: "koreanFlag")
    let flag5 = UIImage(named: "philipinoFlag")
    
    let kazuyaSprite1 = UIImage(named: "kazuyaLeftLeg")
    let kazuyaSprite2 = UIImage(named: "kazuyaNeutral")
    let kazuyaSprite3 = UIImage(named: "kazuyaRightLeg")
    let kazuyaSpriteArray = [kazuyaSprite1, kazuyaSprite2, kazuyaSprite3, kazuyaSprite2]
    let kazuyaSpriteAnimated = UIImage.animatedImage(with: kazuyaSpriteArray as! [UIImage], duration: 1)
    
    let heihachiSprite1 = UIImage(named: "heihachiLeftLeg")
    let heihachiSprite2 = UIImage(named: "heihachiNeutral")
    let heihachiSprite3 = UIImage(named: "heihachiRightLeg")
    let heihachiSpriteArray = [heihachiSprite1, heihachiSprite2, heihachiSprite3, heihachiSprite2]
    let heihachiSpriteAnimated = UIImage.animatedImage(with: heihachiSpriteArray as! [UIImage], duration: 1)
    
    let devilSprite1 = UIImage(named: "devilLeftLeg")
    let devilSprite2 = UIImage(named: "devilNeutral")
    let devilSprite3 = UIImage(named: "devilRightLeg")
    let devilSpriteArray = [devilSprite1, devilSprite2, devilSprite3, devilSprite2]
    let devilSpriteAnimated = UIImage.animatedImage(with: devilSpriteArray as! [UIImage], duration: 1)
    
    
    let player1 = Player(flag: flag4, sprite: kazuyaSpriteAnimated, name: "Devil Piggy Jin", twitch: "https://www.twitch.tv/sslaeppa", userID: "40728579")
    let player2 = Player(flag: flag2, sprite: kazuyaSpriteAnimated, name: "Cyrox", twitch: "https://www.twitch.tv/cyrox", userID: "504840")
    let player3 = Player(flag: flag4, sprite: devilSpriteAnimated, name: "Qudans", twitch: "https://www.twitch.tv/qudans1987", userID: "129671338")
    let player4 = Player(flag: flag4, sprite: kazuyaSpriteAnimated, name: "tkfightspirit", twitch: "https://www.twitch.tv/tkfightspirit", userID: "151547196")
    let player5 = Player(flag: flag1, sprite: kazuyaSpriteAnimated, name: "MrKhan", twitch: "https://www.twitch.tv/mrkhan_", userID: "171707568")
    let player6 = Player(flag: flag5, sprite: devilSpriteAnimated, name: "El", twitch: "https://www.twitch.tv/dvj_el", userID: "154106905")
    let player7 = Player(flag: flag3, sprite: devilSpriteAnimated, name: "LegendaryMihawk", twitch: "https://www.twitch.tv/legendarymihawk", userID: "55932070")
    let player8 = Player(flag: flag4, sprite: heihachiSpriteAnimated, name: "DDUNGNYANG", twitch: "https://www.twitch.tv/dingerchung", userID: "66308786")
    let player9 = Player(flag: flag1, sprite: heihachiSpriteAnimated, name: "m5m", twitch: "https://www.twitch.tv/mau5mat", userID: "27524020")
    
    players += [player1, player2, player3, player4, player5, player6, player7, player8, player9]
  }
  
  //TableView Functions defined below
  
  /* Depending on the index the cell is pressed at, I want to populate the 'blank' PlayerVodTableView with a selection of VODs via a GET request
   using the Twitch API and Alamofire to hopefully handle that.
 */
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let player = players[indexPath.row]
    
    PlayerVodTableViewController.push(from: self.navigationController!, withPlayer: player)
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
}
