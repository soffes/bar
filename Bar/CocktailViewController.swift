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
	fileprivate let textView: UITextView = {
		let textView = UITextView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.isEditable = false
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

		view.backgroundColor = .white

		view.addSubview(textView)
        
		let views = [ "textView": textView ]
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[textView]|", options: [], metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[textView]|", options: [], metrics: nil, views: views))
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
			guard let text = self?.cocktail.loadRecipe() else {
                return
            }
            
            DispatchQueue.main.async {
				let style = NSMutableParagraphStyle()
				style.lineHeightMultiple = 1.2

                self?.textView.attributedText = NSAttributedString(string: text, attributes: [
                    .paragraphStyle: style,
                    .font: UIFont.systemFont(ofSize: 16)
                ])
			}
		}
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		textView.flashScrollIndicators()
	}
}
