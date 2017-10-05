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
		self.init(style: .grouped)
	}


	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Menu"

		tableView.estimatedRowHeight = 100

		DispatchQueue.global(qos: .userInitiated).async {
			self.reloadData()
		}
	}


	// MARK: - Private

	fileprivate func reloadData() {
		let array: [[String: AnyObject]]
		do {
			guard let path = Bundle.main.path(forResource: "Cocktails", ofType: "json", inDirectory: "Data"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
			guard let contents = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] else { return }
			array = contents
		} catch {
			return
		}

		var sections = [Section]()
		for dictionary in array {
			var section = Section(rows: [])

			if let title = dictionary["title"] as? String {
				section.header = .title(title)
			}

			if let items = dictionary["items"] as? [[String: String]] {
				for item in items {
					if let cocktail = Cocktail(dictionary: item) {
						section.rows.append(Row(text: cocktail.title, detailText: cocktail.subtitle, selection: {
							self.didSelectCocktail(cocktail)
						}, accessory: .disclosureIndicator, cellClass: CocktailCell.self))
					}
				}
			}

			sections.append(section)
		}

		DispatchQueue.main.async {
			self.dataSource.sections = sections
		}
	}

	fileprivate func didSelectCocktail(_ cocktail: Cocktail) {
		let viewController = CocktailViewController(cocktail: cocktail)
		navigationController?.pushViewController(viewController, animated: true)
	}
}
