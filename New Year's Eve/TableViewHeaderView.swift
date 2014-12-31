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
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let textSize = titleLabel.intrinsicContentSize()
        titleLabel.frame = CGRect(
            x: 15,
            y: bounds.size.height - 8 - textSize.height,
            width: bounds.size.width - 15 - 8,
            height: textSize.height
        )
    }
}
