//
//  StringExtension.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 06/06/19.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import Foundation

extension String {
    static func localize(_ string: String) -> String {
        return NSLocalizedString(string, comment: "")
    }
}
