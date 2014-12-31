//
//  TableViewHeaderView.swift
//  New Year's Eve
//
//  Created by Caleb Davenport on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

class TableViewHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.textColor = UIColor(red:0.800, green:0.271, blue:0.216, alpha: 1)
        view.font = UIFont(name: "Avenir-Book", size: 12)
        return view
    }()
    
    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    
    private func setupConstraints() {
        let views = [
            "titleLabel": titleLabel
        ]
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-15-[titleLabel]-8-|", options: nil, metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-15-[titleLabel]-4-|", options: nil, metrics: nil, views: views))
    }
}
