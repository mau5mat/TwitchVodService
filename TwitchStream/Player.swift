//
//  Player.swift
//  TwitchStream
//
//  Created by Matt Roberts on 23/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

struct Player {
  
  let flag: UIImage?
  let sprite: UIImage?
  let name: String
  let twitch: String
  let userID: String
  
  init(flag: UIImage?, sprite: UIImage?, name: String, twitch: String, userID: String) {
    self.flag = flag
    self.sprite = sprite
    self.name = name
    self.twitch = twitch
    self.userID = userID
  }
}

  

