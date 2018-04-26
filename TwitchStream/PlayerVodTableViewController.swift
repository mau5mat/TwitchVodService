//
//  PlayerVodTableViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 19/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerVodTableViewController: UITableViewController, TwitchWebServiceProtocol {
  
  private var vods: [Vod]?
  var player: Player?
  private let webService = TwitchWebService()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.webService.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let player = self.player {
      self.webService.requestPlayerVOD(withPlayer: player)
    }
  }
  
  func twitchWebService(_ webService: TwitchWebService, recievedVODs VODs: [Vod]) {
    print("Recieved VODs: \(VODs)")
    self.vods = VODs
    self.tableView.reloadData()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.vods?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.contentView.backgroundColor = .red
    
    return cell
  }
  
  static func push(from navigationController: UINavigationController, withPlayer player: Player) {
    
    if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerVodTableViewController") as? PlayerVodTableViewController {
      viewController.player = player
      navigationController.pushViewController(viewController, animated: true)
    }
  }
}
