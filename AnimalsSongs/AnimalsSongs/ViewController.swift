//
//  ViewController.swift
//  AnimalsSongs
//
//  Created by Rethink on 21/03/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dogSong(_ sender: Any) {
        play(songName: "cao")
    }
    @IBAction func catSong(_ sender: Any) {
        play(songName: "gato")
    }
    @IBAction func lionSong(_ sender: Any) {
        play(songName: "leao")
    }
    @IBAction func monkeySong(_ sender: Any) {
        play(songName: "macaco")
    }
    @IBAction func sheepSong(_ sender: Any) {
        play(songName: "ovelha")
    }
    @IBAction func cowSong(_ sender: Any) {
        play(songName: "vaca")
    }
    
    func play(songName: String){
        if let path = Bundle.main.path(forResource: songName, ofType: "mp3"){
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                player.play()
            } catch  {
                print("erro ao executar o som")
            }
        }
        
    }
    
}

