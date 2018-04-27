//
//  TwitchWebService.swift
//  TwitchStream
//
//  Created by Matt Roberts on 17/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import Alamofire


protocol TwitchWebServiceProtocol {
  func twitchWebService(_ webService: TwitchWebService, recievedVODs VODs:[Vod])
  
}


class TwitchWebService {
  // need?
  // private let tekkenGameID = 461067
  
  var delegate: TwitchWebServiceProtocol?
  
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
      .responseJSON { (response) in print("response = \(response)")
        switch response.result {
        case .success(let value):
          if let value = value as? [String: AnyObject], let dataVodArray = value["data"] as? [[String: AnyObject]] {
            var vods = [Vod]()
            
            for dataVod in dataVodArray {
              // parsing
            // testing purposes print(dataVod["id"] as? String)
              
              if let blobID = dataVod["id"] as? String,
                let blobUserID = dataVod["user_id"] as? String,
                let blobThumb = dataVod["thumbnail_url"] as? String,
                let blobURL = dataVod["url"] as? String,
                let blobViewCount = dataVod["view_count"] as? Int,
                let blobTitle = dataVod["title"] as? String {
              
 
                let vodObj = Vod(id: blobID, userID: blobUserID, thumbNailURL: blobThumb, url: blobURL, viewCount: blobViewCount, title: blobTitle)
                
                vods.append(vodObj)
                // make Vod object with the above variables and then add object to vods[]
              }
            }
            self.delegate?.twitchWebService(self, recievedVODs: vods)
          }
          break
        case .failure(let error):
          print("Error result: \(error)")
          return
        }
        
        
    }
  }
  
}
