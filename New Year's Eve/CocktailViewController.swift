//
//  CocktailViewController.swift
//  New Year's Eve
//
//  Created by Sam Soffes on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

class CocktailViewController: UIViewController {
	var cocktail: Cocktail? {
		didSet {
			reload()
		}
	}

	@IBOutlet var textView: UITextView?

	override func viewDidLoad() {
		super.viewDidLoad()

		automaticallyAdjustsScrollViewInsets = false

		if let textView = textView {
			textView.alwaysBounceVertical = true
			textView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
		}
		
		reload()
	}

	private func reload() {
		title = cocktail?.title
		textView?.text = cocktail?.recipe
	}
}
