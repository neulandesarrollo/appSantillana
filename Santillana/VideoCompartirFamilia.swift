//
//  VideoCompartirFamilia.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 13/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoCompartirFamilia: AVPlayerViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let path = Bundle.main.path(forResource: "Video_Compartir_En_Familia", ofType: "mp4") else {
            debugPrint("Video_Compartir_En_Familia.mp4 not found")
            return
        }
        
        self.videoGravity = AVLayerVideoGravityResize
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
    }
    
}
