//
//  ViewController.swift
//  EggTimer
//
//  Created by Sebas on 15/06/22.
//

//Libreria General
import UIKit
//Libreria para traer la reproducir audios
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressTime: UIProgressView!
    
    //Dictionary de tipo de huevo y tiempo
    let eggTimes = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    //Variable para llamar al audio
    var player: AVAudioPlayer!

    //Button
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes [hardness]!
        
        progressTime.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
    }
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressTime.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!!!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
