//
//  SourceViewController.swift
//  Project 1
//
//  Created by David Mascall on 17/06/2020.
//  Copyright © 2020 David Mascall. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    
}
