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
    
    @IBAction func clockColorSegmentToggled(_ sender: Any) {
        
        if (clockColorSegCtrl.selectedSegmentIndex == 0) {
            clockLabel.textColor = UIColor.white
        } else if (clockColorSegCtrl.selectedSegmentIndex == 1) {
            clockLabel.textColor = UIColor.black
        } else if (clockColorSegCtrl.selectedSegmentIndex == 2) {
            clockLabel.textColor = UIColor.blue
        } else if (clockColorSegCtrl.selectedSegmentIndex == 3) {
            clockLabel.textColor = UIColor.green
        }
    }
    
    @IBAction func backgroundColorSegmentToggled(_ sender: Any) {
        
        if (backgroundColorSegCtrl.selectedSegmentIndex == 0) {
            self.view.backgroundColor = UIColor.black
        } else if (backgroundColorSegCtrl.selectedSegmentIndex == 1) {
            self.view.backgroundColor = UIColor.white
        } else if (backgroundColorSegCtrl.selectedSegmentIndex == 2) {
            self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else if (backgroundColorSegCtrl.selectedSegmentIndex == 3) {
            self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
    }
    
    @objc func updateTimer() {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        
        clockLabel.text = timeFormatter.string(from: Date())
    }


}

