//
//  PlayerVodWebViewController.swift
//  TwitchStream
//
//  Created by Matt Roberts on 30/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit
import WebKit

class PlayerVodWebViewController: UIViewController {
  
  private var vod: Vod?
  var player: Player?
  private let webService = TwitchWebService()
  
  //MARK: Outlets
  @IBOutlet weak var webView: WKWebView!
  
  override func loadView() {
    super.loadView()
    self.webView = WKWebView()
    self.view = self.webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let vodURL = URL(string: (vod?.url)!)
    let myRequest = URLRequest(url: vodURL!)
    self.webView.load(myRequest)
  }
  
  
  static func push(from navigationController: UINavigationController?, withVod vod: Vod) {
    
    if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerVodWebViewController") as? PlayerVodWebViewController {
      viewController.vod = vod
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
}
