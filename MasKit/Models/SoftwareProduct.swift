//
//  SoftwareProduct.swift
//  MasKit
//
//  Created by Ben Chatelain on 12/27/18.
//  Copyright © 2018 mas-cli. All rights reserved.
//

import Foundation

/// Protocol describing the members of CKSoftwareProduct used throughout MasKit.
public protocol SoftwareProduct {
    var appName: String { get }
    var bundleIdentifier: String { get set }
    var bundlePath: String { get set }
    var bundleVersion: String { get set }
    var itemIdentifier: NSNumber { get set }
}

// MARK: - Equatable
extension SoftwareProduct {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.appName == rhs.appName
            && lhs.bundleIdentifier == rhs.bundleIdentifier
            && lhs.bundlePath == rhs.bundlePath
            && lhs.bundleVersion == rhs.bundleVersion
            && lhs.itemIdentifier == rhs.itemIdentifier
    }

    /// Returns bundleIdentifier if appName is empty string.
    var appNameOrBbundleIdentifier: String {
        appName == "" ? bundleIdentifier : appName
    }
}
