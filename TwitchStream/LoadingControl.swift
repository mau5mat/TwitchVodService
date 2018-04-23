//
//  LoadingControl.swift
//  TwitchStream
//
//  Created by Matt Roberts on 18/04/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit
import AVFoundation

class LoadingControl: UIStackView {

  private var audioPlayer: AVAudioPlayer?
  private var loadingImageArray = [UIImageView]()
  
  // MARK: Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupLoadingImages()
  }
  
  // MARK: Private methods
  
  // This function takes the filename of the .wav files located in the Assets folder of the application passed as a String and plays it
  private func playSoundClips(fileName: String) {
    
    if let soundClip = NSDataAsset(name: fileName) {
      do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        try audioPlayer = AVAudioPlayer(data: soundClip.data)
        
        self.audioPlayer?.play()
        
      
      } catch let error {
        NSLog(error.localizedDescription)
      }
    }
  }
  
  // 
  private func setupLoadingImages() {
    
    let loadingImageView1 = UIImageView() // f
    loadingImageView1.alpha = 0
    loadingImageView1.image = UIImage(named: "arrowSplash")?.withRenderingMode(.alwaysTemplate) // Edit String when photo acquired
    loadingImageView1.tintColor = .white
    // Add constraints
    loadingImageView1.translatesAutoresizingMaskIntoConstraints = false
    loadingImageView1.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    loadingImageView1.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    let loadingImageView2 = UIImageView() // n
    loadingImageView2.alpha = 0
    loadingImageView2.image = UIImage(named: "starSplash")?.withRenderingMode(.alwaysTemplate) // Edit String when photo acquired
    loadingImageView2.tintColor = .white
    // Add constraints
    loadingImageView2.translatesAutoresizingMaskIntoConstraints = false
    loadingImageView2.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    loadingImageView2.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    let loadingImageView3 = UIImageView() // d/f
    loadingImageView3.alpha = 0
    loadingImageView3.image = UIImage(named: "arrowSplash")?.withRenderingMode(.alwaysTemplate) // Edit String when photo acquired
    loadingImageView3.tintColor = .white
    loadingImageView3.transform = CGAffineTransform(rotationAngle: 45 * CGFloat.pi / 180)
    
    // Add constraints
    loadingImageView3.translatesAutoresizingMaskIntoConstraints = false
    loadingImageView3.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    loadingImageView3.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    let loadingImageView4 = UIImageView() // +
    loadingImageView4.alpha = 0
    loadingImageView4.image = UIImage(named: "plusSplash")?.withRenderingMode(.alwaysTemplate) // Edit String when photo acquired
    loadingImageView4.tintColor = .white
    loadingImageView4.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    // Add constraints
    loadingImageView4.translatesAutoresizingMaskIntoConstraints = false
    loadingImageView4.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    loadingImageView4.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    let loadingImageView5 = UIImageView() // 2
    loadingImageView5.alpha = 0
    loadingImageView5.image = UIImage(named: "twoSplash")?.withRenderingMode(.alwaysTemplate) // Edit String when photo acquired
    loadingImageView5.tintColor = .white
    // Add constraints
    loadingImageView5.translatesAutoresizingMaskIntoConstraints = false
    loadingImageView5.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    loadingImageView5.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
    
    // Adding variables to the UIImgeView array
    loadingImageArray.insert(loadingImageView1, at: 0)
    loadingImageArray.insert(loadingImageView2, at: 1)
    loadingImageArray.insert(loadingImageView3, at: 2)
    loadingImageArray.insert(loadingImageView4, at: 3)
    loadingImageArray.insert(loadingImageView5, at: 4)
    
    // Each element in the array gets passed to addArrangedSubview() function which displays them on the splash screen
    for item in loadingImageArray {
    addArrangedSubview(item)
    }
    // This binds fadeInImages() to this function
  }
  
  // This function iterates through loadingImagesArray[] and fades in each element of the array over 0.3s
  func fadeInImages(index: Int = 0, from viewController: UIViewController) {
    UIView.animate(withDuration: 0.3, animations: {
      // Fades in
      let imageView = self.loadingImageArray[index]
      imageView.alpha = 1
    }) { (finished) in
      // Completion
      if index < self.loadingImageArray.count - 1 {
        self.fadeInImages(index: index + 1, from: viewController)
      } else {
        self.playSoundClips(fileName: "doryaSoundClip")
        PlayerTableViewController.present(from: viewController)
      }
    }
  }
}
