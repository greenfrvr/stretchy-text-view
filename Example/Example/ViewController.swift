//
//  ViewController.swift
//  Example
//
//  Created by Artsiom Grintsevich on 06.04.2018.
//  Copyright © 2018 Artsiom Grintsevich. All rights reserved.
//

import UIKit
import StretchyTextView

class ViewController: UIViewController {

    @IBOutlet weak var stretchyInputView: StretchyTextView!
    
    @IBAction func spacingChanged(_ sender: UISlider) {
        stretchyInputView.lineSpacing = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stretchyInputView.layer.cornerRadius = 4
    }
}

