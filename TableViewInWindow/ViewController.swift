//
//  ViewController.swift
//  TableViewInWindow
//
//  Created by Sebastien hamel on 2016-02-25.
//  Copyright © 2016 Sebastien hamel. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource {

    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                  MARK: NSTableViewDataSource protocol implementation
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        
        return 10
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self)  as! NSTableCellView
        
        // here we should put the reference to the selectable circle...
        //            cellView.imageView!.image =
        cellView.textField!.stringValue = "Text is too long for the table cell view. Right now it is truncated but I would like the table view and NSWindow to adjust to the size (width, no wrapping) of it."
        
        return cellView
    }
    
}

