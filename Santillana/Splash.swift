//
//  Splash.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 12/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class Splash: AVPlayerViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.playVideo()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "Intro", ofType:"mp4") else {
            debugPrint("Intro.mp4 not found")
            return
        }
        
        self.videoGravity = AVLayerVideoGravityResize
        self.view.addSubview(UIView(frame: self.view.frame))
        
        let item = AVPlayerItem(url: URL(fileURLWithPath: path))
        NotificationCenter.default.addObserver(self, selector: #selector(Splash.continueToMainView), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: item)
        
        let player = AVPlayer(playerItem: item)
        
        self.player = player
        self.player!.play()
    }
    
    public func continueToMainView(){
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ViewController")
        self.present(vc, animated: false, completion: {
            self.player = nil
        })
    }

}
