//
//  CocktailViewController.swift
//  Bar
//
//  Created by Sam Soffes on 6/27/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import UIKit

class CocktailViewController: UIViewController {

	// MARK: - Properties

	let cocktail: Cocktail
	private let textView: UITextView = {
		let textView = UITextView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.editable = false
		textView.font = UIFont.systemFontOfSize(16)
		textView.textContainerInset = UIEdgeInsetsMake(16, 16, 16, 16)
		textView.alwaysBounceVertical = true
		return textView
	}()


	// MARK: - Initializers

	required init(cocktail: Cocktail) {
		self.cocktail = cocktail
		super.init(nibName: nil, bundle: nil)

		title = cocktail.title
	}

	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .whiteColor()

		view.addSubview(textView)

		let views = [ "textView": textView ]
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[textView]|", options: [], metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[textView]|", options: [], metrics: nil, views: views))

		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
			if let text = self.cocktail.recipe {
				let style = NSMutableParagraphStyle()
				style.lineHeightMultiple = 1.2

				let string = NSAttributedString(string: text, attributes: [
					NSParagraphStyleAttributeName: style,
					NSFontAttributeName: self.textView.font!
				])

				dispatch_async(dispatch_get_main_queue()) {
					self.textView.attributedText = string
				}
			}
		}
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		textView.flashScrollIndicators()
	}
}
