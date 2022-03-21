//
//  ViewController.swift
//  MusicTest
//
//  Created by Rethink on 21/03/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var sliderVolume: UISlider!
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "cigarettes after sex - K", ofType: "mp3"){
            let url = URL(fileURLWithPath: path)
           
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
        
            } catch  {
                print("erro")
            }
        }
     
    }

    @IBAction func stopButton(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    
    @IBAction func playButton(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
    }
    @IBAction func updateVolume(_ sender: Any) {
        player.volume = sliderVolume.value
    }
}

