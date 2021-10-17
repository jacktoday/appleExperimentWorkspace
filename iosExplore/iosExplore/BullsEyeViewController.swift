//
//  BullsEyeViewController.swift
//  iosExplore
//
//  Created by fulin on 6/9/21.
//

import UIKit

class BullsEyeViewController: UIViewController {

    var selectedValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var selectedValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetValue = Int.random(in: 0...100)
        selectedValueLabel.text = "\(targetValue)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func slideChanged(_ sender: Any) {
        selectedValue = lroundf(slider.value)
    }
    
    

    @IBAction func buttonTap(_ sender: Any) {
        
        let alert = UIAlertController(title: "My Alert", message: "target: \(targetValue) \n current: \(selectedValue)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
