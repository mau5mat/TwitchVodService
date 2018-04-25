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
  
  func requestPlayerVOD(withPlayer player: Player) {
    let URL = "https://api.twitch.tv/helix/videos?user_id=\(player.userID)&sort=time&type=archive"
    let apiKey = "Client-ID"
    let apiValue = "v6fm8a0z2vinfyqx54opbkle2a0xwh"
    let header: HTTPHeaders = [apiKey:apiValue]
    
    Alamofire.request(
      URL,
      method: .get,
      parameters: nil,
      encoding: JSONEncoding.default,
      headers: header)
      .validate()
      .responseJSON { (response) -> Void in
        guard response.result.isSuccess else {
          print("Error while fetching data for \(player.name)")
          
          return
        }
        print(response)
        
        switch response.result {
        case .success(let value):
          if let value = value as? [String: AnyObject], let dataVodArray = value["data"] as? [[String: AnyObject]] {
            // var vods = [VOD]()
            for dataVod in dataVodArray {
              // parsing
              if let url = dataVod["url"] as? String {
                
              }
            }
            //self.delegate?
          }
          break
        case .failure(let error):
          break
        }
        

    }
  }
  
}
