//
//  HomeController.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2024/3/4.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import LuckyToolKit

class HomeController: ViewController {
    
    @UDStorable(key: "aa", defoult: [])
    var aa: [Int]

    @IBOutlet weak var btn: IBButton!
    
    
    @IBOutlet weak var blueView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btn.publisher(events: .touchUpInside).sink { _ in
            self.cancellables.forEach{$0.cancel()}
        }.store(in: &cancellables)
        
        
        let publisher = blueView.publisher(gestureRecognizer: UITapGestureRecognizer())
            
        publisher.sink { _ in
            log("-----")
        }.store(in: &cancellables)
        
        publisher.sink { _ in
            log("++++++")
        }.store(in: &cancellables)
    }



}
