//
//  NotificationConstants.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 04/03/2019.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let ImageDownloaded = Notification.Name("ImageDownloaded")
    static let MoviesDownloaded = Notification.Name("MoviesDownloaded")
    static let InternetConnected = Notification.Name("InternetConnected")
    static let InternetDisconnected = Notification.Name("InternetDisconnected")
}

struct NotificationKeys {
    static let movieId = "id"
}
