//
//  Player.swift
//  TwitchStream
//
//  Created by Matt Roberts on 23/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

struct Player {
  
  let flag: UIImage
  let name: String
  let twitch: String
  
  init!(flag: UIImage, name: String, twitch: String) {
    self.flag = flag
    self.name = name
    self.twitch = twitch
  }
}

  

