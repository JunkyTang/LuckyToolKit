//
//  XibTestController.swift
//  LuckyToolKit_Example
//
//  Created by junky on 2022/3/4.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import LuckyToolKit

class XibTestController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let header = HeaderView.loadFromXib()
        header.layoutIfNeeded()
        tableview.tableHeaderView = header
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }

    @IBOutlet weak var tableview: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension XibTestController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "2222"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return HeaderView.loadFromXib()
//    }
//    
}

