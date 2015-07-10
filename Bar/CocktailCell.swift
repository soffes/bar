//
//  CocktailCell.swift
//  Bar
//
//  Created by Sam Soffes on 6/27/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import UIKit
import Static

class CocktailCell: UITableViewCell, CellType {

	// MARK: - Initializers
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
		initialize()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initialize()
	}


	// MARK: - Private

	private func initialize() {
		guard let textLabel = textLabel, detailTextLabel = detailTextLabel else { return }

		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.font = UIFont(name: "Georgia", size: 20)

		detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
		detailTextLabel.font = UIFont.systemFontOfSize(14)
		detailTextLabel.numberOfLines = 3
		detailTextLabel.textColor = UIColor(white: 0.6, alpha: 1)

		contentView.removeConstraints(textLabel.constraints)
		contentView.removeConstraints(detailTextLabel.constraints)

		let views = [
			"textLabel": textLabel,
			"detailTextLabel": detailTextLabel
		]

		let metrics = [
			"margin": 16,
		]

		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-margin-[textLabel]-margin-|", options: [], metrics: metrics, views: views))
		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-margin-[detailTextLabel]-margin-|", options: [], metrics: metrics, views: views))
		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[textLabel]-4-[detailTextLabel]-margin-|", options: [], metrics: metrics, views: views))
	}
}