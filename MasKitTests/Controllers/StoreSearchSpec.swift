//
//  StoreSearchSpec.swift
//  MasKitTests
//
//  Created by Ben Chatelain on 1/11/19.
//  Copyright © 2019 mas-cli. All rights reserved.
//
@testable import MasKit
import Nimble
import Quick
import Result

/// Protocol minimal implementation
struct StoreSearchForTesting: StoreSearch {
    func lookup(app _: Int) throws -> SearchResult? { return nil }
    func search(for _: String) throws -> SearchResultList { return SearchResultList(resultCount: 0, results: []) }
}

class StoreSearchSpec: QuickSpec {
    override func spec() {
        let storeSearch = StoreSearchForTesting()

        describe("url string") {
            it("contains the app name") {
                let appName = "myapp"
                let urlString = storeSearch.searchURLString(forApp: appName)
                expect(urlString) ==
                    "https://itunes.apple.com/search?entity=macSoftware&term=\(appName)&attribute=allTrackTerm"
            }
            it("contains the encoded app name") {
                let appName = "My App"
                let appNameEncoded = "My%20App"
                let urlString = storeSearch.searchURLString(forApp: appName)
                expect(urlString) ==
                    "https://itunes.apple.com/search?entity=macSoftware&term=\(appNameEncoded)&attribute=allTrackTerm"
            }
            // Find a character that causes addingPercentEncoding(withAllowedCharacters to return nil
            xit("is nil when app name cannot be url encoded") {
                let appName = "`~!@#$%^&*()_+ 💩"
                let urlString = storeSearch.searchURLString(forApp: appName)
                expect(urlString).to(beNil())
            }
        }
    }
}
