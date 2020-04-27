//
//  DateFormatter+.swift
//  GitHubGists
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation

extension DateFormatter {
    convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }
}
