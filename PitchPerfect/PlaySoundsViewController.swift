//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Lucas Orso on 8/4/18.
//  Copyright © 2018 Lucas Orso. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, high_pitch, low_pitch, echo, reverb
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    @IBAction func playButtonsSounds(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.3)
            case .fast:
                playSound(rate: 1.7)
            case .high_pitch:
                playSound(pitch: 1500)
            case .low_pitch:
                playSound(pitch: -1300)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopPlaySound(_ sender: UIButton) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
}
