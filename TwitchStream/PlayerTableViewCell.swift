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
  @IBOutlet weak var countryFlagContainerView: UIView!
  @IBOutlet weak var countryFlag: UIImageView!
  @IBOutlet weak var characterSprite: UIImageView!
  @IBOutlet weak var streamName: UILabel!
  @IBOutlet weak var streamTwitch: UILabel!

  
  func set(player: Player) {
    self.countryFlag.image = player.flag
    self.characterSprite.image = player.sprite
    self.streamName.text = player.name
    self.streamTwitch.text = player.twitch
    self.countryFlag.layer.cornerRadius = 2
    self.countryFlag.layer.masksToBounds = true
    self.countryFlagContainerView.layer.shadowOpacity = 0.7
    self.countryFlagContainerView.layer.shadowColor = UIColor.black.cgColor
    self.countryFlagContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
    self.countryFlagContainerView.layer.shadowRadius = 2
  }
  
  func animateSprites(spriteImageArray: [UIImage]) {
    let animation = UIImage.animatedImage(with: spriteImageArray, duration: 1)
    self.characterSprite.image = animation
    
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
