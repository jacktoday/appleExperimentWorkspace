//
//  InterfaceController.swift
//  WatchExper WatchKit Extension
//
//  Created by fulin on 30/1/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var button: WKInterfaceButton!
    
    
    @IBAction func buttonTap() {
        
    }
    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
