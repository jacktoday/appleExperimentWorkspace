//
//  EmptyViewController.swift
//  iosExplore
//
//  Created by fulin on 19/1/23.
//

import UIKit
import MyKit

class EmptyViewController: UIViewController {

    
    private let mykit: MyKit = MyKitImp()
    
    private lazy var mykitview: UIView = {
        // return MyKitImp().buildView()
        return mykit.buildView(themeColor: .bgColor1)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        [mykitview, UIView()].forEach(view.addSubview(_:))    // clean way to add into subview
        
        NSLayoutConstraint.activate([
            mykitview.heightAnchor.constraint(equalToConstant: 200),
            mykitview.widthAnchor.constraint(equalToConstant: 200),
            mykitview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mykitview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        
    }
}
