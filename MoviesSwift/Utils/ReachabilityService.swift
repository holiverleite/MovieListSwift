//
//  ReachabilityService.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 06/03/19.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import Foundation
import Reachability

final class ReachabilityService {
    
    private static let reachability = Reachability()!

    static func start() {

        self.reachability.whenReachable = { _ in
            print("Internet connected")
            NotificationCenter.default.post(name: .InternetConnected, object: nil)
        }

        self.reachability.whenUnreachable = { _ in
            print("Internet disconnected")
            NotificationCenter.default.post(name: .InternetDisconnected, object: nil)
        }

        do {
            try self.reachability.startNotifier()
        } catch {
            print("Failed to start Reachability")
        }
    }

    static func isConnected() -> Bool {
        switch ReachabilityService.reachability.connection {
        case .none:
            return false
        case .wifi, .cellular:
            return true

        }
    }
}


