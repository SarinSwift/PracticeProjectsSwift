//
//  ViewController.swift
//  TextToSpeech
//
//  Created by Sarin Swift on 2/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func speechButton(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: textField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
}

