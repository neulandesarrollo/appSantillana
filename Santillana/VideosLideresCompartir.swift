//
//  VideosLideresCompartir.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 13/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideosLideresCompartir: AVPlayerViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let path = Bundle.main.path(forResource: "Video_Lideres_Compartir", ofType: "mp4") else {
            debugPrint("Video_Lideres_Compartir.mp4 not found")
            return
        }
        
        self.videoGravity = AVLayerVideoGravityResize
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
    }
    
}
