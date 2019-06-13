//
//  ViewController.swift
//  AudioDemo
//
//  Created by Alan Lam on 6/9/19.
//  Copyright © 2019 ntrllog. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadAudioFile()
    }
    
    func loadAudioFile() {
        guard let audioFilePath = Bundle.main.path(forResource: "name", ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        let audioFileUrl = NSURL.fileURL(withPath: audioFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileUrl, fileTypeHint: nil)
            audioPlayer.numberOfLoops = 0
        }
        catch {
            print("AVAudioPlayer error = \(error)")
        }
    }
    
    @IBAction func doPauseButton(_ sender: UIBarButtonItem) {
        audioPlayer.pause()
    }
    
    @IBAction func doPlayButton(_ sender: UIBarButtonItem) {
        audioPlayer.play()
    }
    
    @IBAction func doStopButton(_ sender: UIBarButtonItem) {
        audioPlayer.stop()
        loadAudioFile()
    }
    
}

