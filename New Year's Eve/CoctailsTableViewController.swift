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
        if let url = NSBundle.mainBundle().URLForResource("Cocktails", withExtension: "json", subdirectory: "Data") {
            if let data = NSData(contentsOfURL: url) {
                return NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSArray
            }
        }
        return nil
    }()
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.estimatedRowHeight = 54
        tableView?.rowHeight = UITableViewAutomaticDimension
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
    
    private func cocktailAtIndexPath(indexPath: NSIndexPath) -> Cocktail? {
        if let items = itemsInSection(indexPath.section) {
            if let dictionary = items[indexPath.row] as? NSDictionary {
                return Cocktail(dictionary: dictionary)
            }
        }
        return nil
    }


	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Cocktails"
	}
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInSection(section)?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as CocktailTableViewCell
        let cocktail = cocktailAtIndexPath(indexPath)
        cell.titleLabel?.text = cocktail?.title
        cell.subtitleLabel?.text = cocktail?.subtitle
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

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		super.prepareForSegue(segue, sender: sender)

		if let navigationController = segue.destinationViewController as? UINavigationController {
			if let viewController = navigationController.topViewController as? CocktailViewController {
				if let indexPath = tableView.indexPathForSelectedRow() {
					viewController.cocktail = cocktailAtIndexPath(indexPath)
				}
			}
		}
	}
}
