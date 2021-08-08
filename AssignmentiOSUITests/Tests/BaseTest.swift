//
//  BaseTest.swift
//  AssignmentiOSUITests
//
//  Created by NF on 08/08/2021.
//

import XCTest

class BaseTest: XCTestCase {
    let app = XCUIApplication(bundleIdentifier: "com.apple.mobileslideshow")
    
    override func setUpWithError() throws {
        app.launchArguments = ["enable-testing"]
        app.launch()

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

}
