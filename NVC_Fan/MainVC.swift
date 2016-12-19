//
//  ViewController.swift
//  NVC_Fan
//
//  Created by Ronnie Stanley on 12/18/16.
//  Copyright © 2016 Ronnie Stanley. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nvcs = [NVC]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Video Cell", for: indexPath) as? VideoCell {
            let nvc = nvcs[indexPath.row]
            
            cell.updateUI(nvc: nvc)
            
            return cell
        
        } else {
        return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nvcs.count
    }

    

}

