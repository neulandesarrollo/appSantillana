//
//  VideoQueEs.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 13/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoQueEs: AVPlayerViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let path = Bundle.main.path(forResource: "Video_Que_Es", ofType: "mp4") else {
            debugPrint("Video_Que_Es.mp4 not found")
            return
        }
        
        self.videoGravity = AVLayerVideoGravityResize
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
    }
    
}
