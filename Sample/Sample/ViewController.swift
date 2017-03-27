//
//  ViewController.swift
//  Sample
//
//  Created by Arror on 2017/3/27.
//  Copyright © 2017年 Arror. All rights reserved.
//

import UIKit
import AttributesBuilder

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = AttributesBuilder()
            .color(.green)
            .font(.boldSystemFont(ofSize: 14.0))
            .characterSpacing(8)
        
        let builder2 = builder.copied.color(.red)
        
        self.contentLabel.attributedText = "Hallo, 我只是一个Label而已."
            .rs.rendered(by: builder)
            .rs.rendered(by: builder2, range: 0..<6)
    }
}

