//
//  InfoViewController.swift
//  TempConverter
//
//  Created by d.chernov on 16/04/2023.
//

import UIKit

class InfoViewController: UIViewController {
    var recievedName: String?
    var recievedDeveloper: String?
    var recievedVersion: String?
    var recievedDate: String?
    var recievedDescription: String?
    
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var developerLabel: UILabel!
    
    @IBOutlet weak var versionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLable.text = recievedName
        developerLabel.text = recievedDeveloper
        versionLabel.text = recievedVersion
        dateLabel.text = recievedDate
        descriptionLabel.text = recievedDescription
    }
    
}
