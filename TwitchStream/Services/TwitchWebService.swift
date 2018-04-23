//
//  TwitchWebService.swift
//  TwitchStream
//
//  Created by Matt Roberts on 17/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import Alamofire

class TwitchWebService {
  
  private let tekkenGameID = 461067
  
  
  func getStreams() {
    if let url = URL(string: "https://api.twitch.tv/helix/streams?game_id=461067&language=ko") {
      var request = URLRequest(url: url)
      request.addValue("v6fm8a0z2vinfyqx54opbkle2a0xwh", forHTTPHeaderField: "Client-ID")
      Alamofire.request(request)
        .responseJSON { (response) in
          // If resposne successful, execute below block
          switch response.result {
            
          case .success(let value):
            print("Success \(value)")
            break
          // If response fails, execute below block
          case .failure(let error):
            print("Failure \(error)")
            break
          }
      }
    }
  }
  
}
