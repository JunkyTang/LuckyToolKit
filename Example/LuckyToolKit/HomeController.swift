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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btn.publisher(events: .touchUpInside).sink { _ in
            let pop = TestPopView.loadFromXib()
            pop.show()
        }.store(in: &cancellables)
        
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
