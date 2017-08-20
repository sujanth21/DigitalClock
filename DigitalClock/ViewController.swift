//
//  ViewController.swift
//  DigitalClock
//
//  Created by Sujanth Sebamalaithasan on 20/8/17.
//  Copyright © 2017 Sujanth Sebamalaithasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var clockColorSegCtrl: UISegmentedControl!
    @IBOutlet weak var backgroundColorSegCtrl: UISegmentedControl!
    @IBOutlet weak var settingsView: UIView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateTimer()
        settingsView.isHidden = true
        settingsBtn.alpha = 0.25
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }

    
    @IBAction func settingsBtnPressed(_ sender: Any) {
        
        if (settingsView.isHidden == true) {
            settingsView.isHidden = false
            settingsBtn.setTitle("Hide Settings", for: .normal)
            settingsBtn.alpha = 1.0
        } else {
            settingsView.isHidden = true
            settingsBtn.setTitle("Show Settings", for: .normal)
            settingsBtn.alpha = 0.25
        }
    
    }
    
    
    
    @objc func updateTimer() {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        
        clockLabel.text = timeFormatter.string(from: Date())
    }


}

