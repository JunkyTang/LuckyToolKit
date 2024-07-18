//
//  HomeController.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2022/3/4.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import LuckyToolKit
import DebugSwift

class HomeController: ViewController {
    
    @UDStorable(key: "aa", defoult: [])
    var aa: [Int]

    @IBOutlet weak var btn: IBButton!
    
    
    @IBOutlet weak var blueView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DebugSwift.setup()
        // Do any additional setup after loading the view.
        
        btn.publisher(events: .touchUpInside).sink { _ in
            TestPopView.loadFromXib().show(self.view)
        }.store(in: &cancellables)
        
        
        let publisher = blueView.publisher(gestureRecognizer: UITapGestureRecognizer())
            
        publisher.sink { _ in
            
        }.store(in: &cancellables)
//        
//        publisher.sink { _ in
//            
//        }.store(in: &cancellables)
    }



}
