//
//  Vod.swift
//  TwitchStream
//
//  Created by Matt Roberts on 25/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

struct Vod {
  
  let id: String
  let userID: String
  let thumbNailURL: String
  let url: String
  let viewCount: String
  
  init(id:String, userID: String, thumbNailURL: String, url: String, viewCount: String) {
    self.id = id
    self.userID = userID
    self.thumbNailURL = thumbNailURL
    self.url = url
    self.viewCount = viewCount
  }
}
