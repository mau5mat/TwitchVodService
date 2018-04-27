//
//  PlayerVodTableViewCell.swift
//  TwitchStream
//
//  Created by Matt Roberts on 27/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerVodTableViewCell: UITableViewCell {
  
  //MARK: Properties
  @IBOutlet weak var vodThumbNailImageView: UIImageView!
  @IBOutlet weak var vodTitleLabel: UILabel?
  @IBOutlet weak var vodViewCountLabel: UILabel?
  
  func set(vod: Vod) {
    
    let modifiedURL = vod.thumbNailURL.replacingOccurrences(of: "%{width}", with: "\(Int(self.vodThumbNailImageView.bounds.width))").replacingOccurrences(of: "%{height}", with: "\(Int(self.vodThumbNailImageView.bounds.height))")
    
    let url = URL(string: modifiedURL)
    self.vodThumbNailImageView?.kf.setImage(with: url)
    self.vodTitleLabel?.text = vod.title
    self.vodViewCountLabel?.text = "\(vod.viewCount)"
    //print(vod.thumbNailURL)
    print(modifiedURL)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
