//
//  ViewController.swift
//  iosExplore
//
//  Created by fulin on 22/8/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstViewContainer: UIView!
    
    @IBOutlet weak var secondViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        firstViewContainer.addGestureRecognizer(tapGestureRecongnizer)
        secondViewContainer.addGestureRecognizer(tapGestureRecongnizer)
        
        Task {
            print("******1)
        }
                  print("******2)
        
        
        
    }
    
    @objc func viewTap(_ sender: UITapGestureRecognizer) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]

            UIView.transition(with: firstViewContainer, duration: 1.0, options: transitionOptions, animations: {
                self.firstViewContainer.isHidden = true
            })

            UIView.transition(with: secondViewContainer, duration: 1.0, options: transitionOptions, animations: {
                self.secondViewContainer.isHidden = false
            })
    }


}

