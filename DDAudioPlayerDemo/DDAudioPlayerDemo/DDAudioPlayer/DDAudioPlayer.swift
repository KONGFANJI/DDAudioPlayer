//
//  DDAudioPlayer.swift
//  DDAudioPlayerDemo
//
//  Created by wuqh on 2018/7/16.
//  Copyright © 2018年 wuqh. All rights reserved.
//

import UIKit
import AVFoundation
/*

 
 */

class DDAudioPlayer: NSObject {
    var player: AVPlayer?
    static let shared: DDAudioPlayer = DDAudioPlayer.init()
    
    
    func play(audioUrl: String) {
        
        guard let url = URL(string: audioUrl) else {
            return
        }

        let playerItem = AVPlayerItem(url: url)

        if let currentPlayer = player {
            currentPlayer.replaceCurrentItem(with: playerItem)
        }else {
            player = AVPlayer(playerItem: playerItem)
        }

        player?.play()
    }
    func pause() {
        player?.pause()
    }
}
