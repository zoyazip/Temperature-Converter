//
//  ViewController.swift
//  TempConverter
//
//  Created by d.chernov on 16/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var value: Int = 0
    
    @IBOutlet weak var convertedValueLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var temperaturePorperty: UISegmentedControl!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var tempSlider: UISlider!{
        didSet{
            tempSlider.minimumValue = -100
            tempSlider.maximumValue = 100
            tempSlider.value = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlurEffect()
        bgImage.tintColor = UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func infoBtnPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "infoSegue", sender: self)
    }
    
    @IBAction func tempSliderValueChanged(_ sender: Any) {
        value = Int(tempSlider.value)
        changeBgColor(value: tempSlider.value)
        changeCelsiusValue(value: value)
        changeConvertedValue(value: value, type: temperaturePorperty.selectedSegmentIndex)
        
    }
    
    @IBAction func propertySelectionPressed(_ sender: Any) {
        changeConvertedValue(value: value, type: temperaturePorperty.selectedSegmentIndex)
        
    }
    
    func addBlurEffect(){
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bgImage.bounds
        bgImage.addSubview(blurEffectView)
   
    }
    
    func changeBgColor(value: Float){
        let hueValueRed: CGFloat = CGFloat((value + 100) / 200)
        let hueValueBlue: CGFloat = 1.0 - hueValueRed
       
        bgImage.tintColor = UIColor(red: hueValueRed, green: 0, blue: hueValueBlue, alpha: 1)
        
    }
    
    func changeCelsiusValue(value: Int){
        let celsiusValue: Int = Int(value)
        celsiusLabel.text = "\(celsiusValue) °C"
    }
    
    func changeConvertedValue(value: Int, type: Int){
        let temperature = Temperature(celsius: Int(value))
        switch type{
        case 0:
            convertedValueLabel.text = "\(temperature.getFahrenheit()) °F"
            break;
        case 1:
            convertedValueLabel.text = "\(temperature.getKelvin()) °K"
            break;
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let info = AboutApp()
        if let destination = segue.destination as? InfoViewController {
            destination.recievedName = info.appName
            destination.recievedDeveloper = info.appAuthor
            destination.recievedVersion = info.appVersion
            destination.recievedDate = info.appDate
            destination.recievedDescription = info.appDescription
        }
    }

}

