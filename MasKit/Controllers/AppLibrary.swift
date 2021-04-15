//
//  AppLibrary.swift
//  MasKit
//
//  Created by Ben Chatelain on 12/27/18.
//  Copyright © 2018 mas-cli. All rights reserved.
//

import Foundation

/// Utility for managing installed apps.
public protocol AppLibrary {
    /// Entire set of installed apps.
    var installedApps: [SoftwareProduct] { get }

    /// Finds an app by ID.
    ///
    /// - Parameter forId: MAS ID for app.
    /// - Returns: Software Product of app if found; nil otherwise.
    func installedApp(forId: UInt64) -> SoftwareProduct?

    /// Finds an app by it's bundle identifier.
    ///
    /// - Parameter forBundleId: Bundle identifier of app.
    /// - Returns: Software Product of app if found; nil otherwise.
    func installedApp(forBundleId: String) -> SoftwareProduct?

    /// Finds an app by name.
    ///
    /// - Parameter named: Name of app.
    /// - Returns: Software Product of app if found; nil otherwise.
    func installedApp(named: String) -> SoftwareProduct?

    /// Uninstalls an app.
    ///
    /// - Parameter app: App to be removed.
    /// - Throws: Error if there is a problem.
    func uninstallApp(app: SoftwareProduct) throws
}

/// Common logic
extension AppLibrary {
    /// Finds an app by name.
    ///
    /// - Parameter id: MAS ID for app.
    /// - Returns: Software Product of app if found; nil otherwise.
    public func installedApp(forId identifier: UInt64) -> SoftwareProduct? {
        let appId = NSNumber(value: identifier)
        return installedApps.first { $0.itemIdentifier == appId }
    }

    /// Finds an app by name.
    ///
    /// - Parameter appName: Full title of an app.
    /// - Returns: Software Product of app if found; nil otherwise.
    public func installedApp(named appName: String) -> SoftwareProduct? {
        installedApps.first { $0.appName == appName }
    }
}
