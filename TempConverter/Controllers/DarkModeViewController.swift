//
//  DarkModeViewController.swift
//  TempConverter
//
//  Created by d.chernov on 16/04/2023.
//

import UIKit

class DarkModeViewController: UIViewController {

    @IBOutlet weak var appearanceState: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func settingsBtnPressed(_ sender: Any) {
        Task { @MainActor in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                // Ask the system to open that URL.
                await UIApplication.shared.open(url)
            }
            
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.userInterfaceStyle == .dark {
            appearanceState.text = "Off"
        } else {
            appearanceState.text = "On"
        }
    }

}
