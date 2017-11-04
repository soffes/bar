//
//  CocktailCell.swift
//  Bar
//
//  Created by Sam Soffes on 6/27/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import UIKit
import Static

final class CocktailCell: UITableViewCell, Cell {

	// MARK: - Initializers
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

		backgroundColor = UIColor(white: 0.05, alpha: 1)

		let selectedView = UIView()
		selectedView.backgroundColor = .black
		selectedBackgroundView = selectedView

		guard let textLabel = textLabel, let detailTextLabel = detailTextLabel else { return }

		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
		textLabel.textColor = .white

		detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
		detailTextLabel.font = UIFont.systemFont(ofSize: 16)
		detailTextLabel.numberOfLines = 3
		detailTextLabel.textColor = UIColor(red: 0.427, green: 0.427, blue: 0.447, alpha: 1)

		contentView.removeConstraints(textLabel.constraints)
		contentView.removeConstraints(detailTextLabel.constraints)
		contentView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

		NSLayoutConstraint.activate([
			textLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
			textLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
			textLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),

			detailTextLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
			detailTextLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
			detailTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 4),
			detailTextLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
		])
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
