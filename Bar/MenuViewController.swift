//
//  MenuViewController.swift
//  Bar
//
//  Created by Sam Soffes on 6/27/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import UIKit
import Static

class MenuViewController: TableViewController {

	// MARK: - Initializers

	convenience init() {
		self.init(style: .Grouped)
	}


	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Menu"

		tableView.estimatedRowHeight = 100

		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
			self.reloadData()
		}
	}


	// MARK: - Private

	private func reloadData() {
		let array: [[String: AnyObject]]
		do {
			guard let path = NSBundle.mainBundle().pathForResource("Cocktails", ofType: "json", inDirectory: "Data"), data = NSData(contentsOfFile: path) else { return }
			guard let contents = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [[String: AnyObject]] else { return }
			array = contents
		} catch {
			return
		}

		var sections = [Section]()
		for dictionary in array {
			var section = Section(rows: [])

			if let title = dictionary["title"] as? String {
				section.header = .Title(title)
			}

			if let items = dictionary["items"] as? [[String: String]] {
				for item in items {
					if let cocktail = Cocktail(dictionary: item) {
						section.rows.append(Row(text: cocktail.title, detailText: cocktail.subtitle, accessory: .DisclosureIndicator, selection: {
							self.didSelectCocktail(cocktail)
						}, cellClass: CocktailCell.self))
					}
				}
			}

			sections.append(section)
		}

		dispatch_async(dispatch_get_main_queue()) {
			self.dataSource.sections = sections
		}
	}

	private func didSelectCocktail(cocktail: Cocktail) {
		let viewController = CocktailViewController(cocktail: cocktail)
		navigationController?.pushViewController(viewController, animated: true)
	}
}
