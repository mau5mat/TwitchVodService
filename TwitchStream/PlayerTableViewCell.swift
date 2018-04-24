//
//  PlayerTableViewCell.swift
//  TwitchStream
//
//  Created by Matt Roberts on 23/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
  
  
  // MARK: Properties
  @IBOutlet weak var countryFlag: UIImageView!
  @IBOutlet weak var streamName: UILabel!
  @IBOutlet weak var streamTwitch: UILabel!
  
  func set(player: Player) {
    self.countryFlag.image = player.flag
    self.streamName.text = player.name
    self.streamTwitch.text = player.twitch
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
