//
//  Spirit.swift
//  New Year's Eve
//
//  Created by Caleb Davenport on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Foundation

struct Spirit {
    let name: String

	// MARK: - Initializers

	init?(dictionary: NSDictionary) {
		switch (dictionary["title"]) {
		case (.Some(let title as String)):
			self.name = title
		default:
			return nil
		}
	}
}
