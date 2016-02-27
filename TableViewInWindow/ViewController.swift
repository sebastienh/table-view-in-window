//
//  ViewController.swift
//  TableViewInWindow
//
//  Created by Sebastien hamel on 2016-02-25.
//  Copyright © 2016 Sebastien hamel. All rights reserved.
//

import Cocoa

extension NSView {
    
    ///
    /// Functions that returns an array of all the constraints affecting a
    /// certain NSLayoutAttribute.
    ///
    func constraintsForAttribute(attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
        
        return constraints.filter { (constraint) -> Bool in
            
            return constraint.firstAttribute == attribute
        }
    }
    
    ///
    /// Return the first constraint affecting a certain NSLayoutAttribute.
    ///
    func constraintForAttribute(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        
        let constraints = constraintsForAttribute(attribute)
        
        if let first = constraints.first {
            
            return first
        }
        
        return nil
    }
}

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet var localTableView: NSTableView!
    @IBOutlet var scrollView: NSScrollView!
    @IBOutlet var tableColumn: NSTableColumn!
    @IBOutlet var scrollViewWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.updateTable()
    }

    override var representedObject: AnyObject? {

        didSet {
        
            // Update the view, if already loaded.
        }
    }

    func updateTable() {
        
        localTableView.reloadData()
        
        var computedWidth: CGFloat = 0
        
        for var row = 0; row < 10; row++  {
            
            let tableCellView = self.tableView(localTableView, viewForTableColumn: tableColumn, row: row) as! NSTableCellView
            
            computedWidth = max(computedWidth, tableCellView.textField!.intrinsicContentSize.width)
        }
        
        scrollViewWidthConstraint!.constant = computedWidth
        
        scrollView.needsUpdateConstraints = true
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    //                                  MARK: NSTableViewDelegate protocol implementation
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
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

