//
//  ShopListViewUITests.swift
//  CartTrackerUITests
//
//  Created by Jaime Jazareno III on 6/8/21.
//

import XCTest

class ShopListViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        setupSnapshot(app)
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialDisplay() throws {
        snapshot("01ShopListView")
        XCTAssertTrue(app.tables["shopList"].exists)
    }
    
    func testAddShopFlow() throws {
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        // if we don't set lifetime to .keepAlways, Xcode will delete the image if the test passes.

        add(screenshot)
        XCTAssertTrue(app.tables["shopList"].exists)
    }
}
