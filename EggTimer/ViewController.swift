//
//  ViewController.swift
//  EggTimer
//
//  Created by Sebas on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft" : 5, "Medium" : 420, "Hard" : 720]
    
    var seconds = 60
    
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
    let hardness = sender.currentTitle!
        
        seconds = eggTimes [hardness]!
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
    }
    @objc func updateTimer(){
        if seconds > 0 {
            print("\(seconds) segundos.")
            seconds -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!!!"
        }
    }
}
