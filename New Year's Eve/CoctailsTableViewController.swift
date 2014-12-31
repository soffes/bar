//
//  CoctailsTableViewController.swift
//  New Year's Eve
//
//  Created by Caleb Davenport on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

class CoctailsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let data: NSArray? = {
        if let url = NSBundle.mainBundle().URLForResource("data", withExtension: "json", subdirectory: "Data") {
            if let data = NSData(contentsOfURL: url) {
                return NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSArray
            }
        }
        return nil
    }()
    
    
    // MARK: - Private
    
    private func itemsInSection(section: Int) -> NSArray? {
        if let value = data {
            if let dictionary = value[section] as? NSDictionary {
                return dictionary["items"] as? NSArray
            }
        }
        return nil
    }
    
    private func cocktailAtIndexPath(indexPath: NSIndexPath) -> Cocktail? {
        if let items = itemsInSection(indexPath.section) {
            if let dictionary = items[indexPath.row] as? NSDictionary {
                switch (dictionary["title"], dictionary["subtitle"]) {
                case (.Some(let title as String), .Some(let subtitle as String)):
                    return Cocktail(title: title, subtitle: subtitle)
                default:
                    return nil
                }
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
        let cocktail = cocktailAtIndexPath(indexPath)
        cell.textLabel?.text = cocktail?.title
        cell.detailTextLabel?.text = cocktail?.subtitle
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let value = data {
            if let dictionary = value[section] as? NSDictionary {
                return dictionary["title"] as? String
            }
        }
        return nil
    }
}
