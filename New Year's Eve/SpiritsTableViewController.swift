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
    
    var data: NSArray? = {
        if let url = NSBundle.mainBundle().URLForResource("Spirits", withExtension: "json", subdirectory: "Data") {
            if let data = NSData(contentsOfURL: url) {
                return NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSArray
            }
        }
        return nil
    }()
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.registerClass(TableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    
    // MARK: - Private
    
    private func itemsInSection(section: Int) -> NSArray? {
        if let value = data {
            if let dictionary = value[section] as? NSDictionary {
                return dictionary["items"] as? NSArray
            }
        }
        return nil
    }
    
    private func spiritAtIndexPath(indexPath: NSIndexPath) -> String? {
        if let items = itemsInSection(indexPath.section) {
            if let dictionary = items[indexPath.row] as? NSDictionary {
                return dictionary["title"] as? String
            }
        }
        return nil
    }
    
    private func titleForSectionAtIndex(section: Int) -> String? {
        if let value = data {
            if let dictionary = value[section] as? NSDictionary {
                return dictionary["title"] as? String
            }
        }
        return nil
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInSection(section)?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = spiritAtIndexPath(indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let title = titleForSectionAtIndex(section) {
            let view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as TableViewHeaderView
            view.titleLabel.text = title.uppercaseString
            return view
        }
        
        return nil
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
