//
//  ViewController.swift
//  PokemonEvoQuiz
//
//  Created by Nghia on 7/15/16.
//  Copyright © 2016 Nghia. All rights reserved.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?

class ViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func playSound() {
            let url = NSBundle.mainBundle().URLForResource("PokemonTVThemeSongFull", withExtension: "mp3")!
            
            do {
                player = try AVAudioPlayer(contentsOfURL: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
            
        }
        
    }
    @IBAction func playMusic(sender: UIButton) {
        func playSound() {
            let url = NSBundle.mainBundle().URLForResource("PokemonTVThemeSongFull", withExtension: "mp3")!
            
            do {
                player = try AVAudioPlayer(contentsOfURL: url)
                guard let player = player else { return }
                
                player.prepareToPlay()
                player.play()
            } catch let error as NSError {
                print(error.description)
            }
            
        }
        playSound()
    }
}

