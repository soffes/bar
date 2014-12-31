//
//  SpiritsTableViewController.swift
//  New Year's Eve
//
//  Created by Caleb Davenport on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

class SpiritsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Private
    
    private func spirit(#indexPath: NSIndexPath) -> Spirit? {
        return nil
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0 // Number of categories
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // Number of drinks in each category
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = spirit(indexPath: indexPath)?.name
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil // Return spirit category
    }
}
