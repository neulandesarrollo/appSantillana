//
//  VideoIntroduccion.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 12/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoIntroduccion: AVPlayerViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let path = Bundle.main.path(forResource: "Video_Intro", ofType: "mov") else {
            debugPrint("Video_Intro.mov not found")
            return
        }
        
        self.videoGravity = AVLayerVideoGravityResize
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
    }

}
