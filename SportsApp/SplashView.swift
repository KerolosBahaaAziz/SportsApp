//
//  SplashView.swift
//  SportsApp
//
//  Created by Kerlos on 07/03/2025.
//

import Foundation
import UIKit
import AVKit

class SplashViewController: UIViewController {
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "video", ofType: "mp4") else {
            print("Video not found")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        
        playerLayer?.frame = view.bounds
        playerLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer!)

        player?.play()

        // Observe when video ends
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinish), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
    
    @objc func videoDidFinish() {
        // Transition to Main ViewController
        if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "tabbar") {
                navigationController?.setViewControllers([tabBarVC], animated: true)
            }
    }
}
