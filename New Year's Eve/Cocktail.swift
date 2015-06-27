//
//  Cocktail.swift
//  New Year's Eve
//
//  Created by Caleb Davenport on 12/31/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Foundation

struct Cocktail {
    
    // MARK: - Properties
    
    let title: String
    let subtitle: String
	var recipe: String? {
		if let url = NSBundle.mainBundle().URLForResource(title, withExtension: "txt", subdirectory: "Data") {
			return NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) as? String
		}
		return nil
	}


    // MARK: - Initializers
    
    init?(dictionary: NSDictionary) {
        switch (dictionary["title"], dictionary["subtitle"]) {
        case (.Some(let title as String), .Some(let subtitle as String)):
            self.title = title
            self.subtitle = subtitle
        default:
            return nil
        }
    }
}
