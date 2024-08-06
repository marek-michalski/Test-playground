//
//  ContentView_UITests.swift
//  Test
//
//  Created by Marek on 02/07/2024.
//

import XCTest

class ContentView_UITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToastAppearsAndDisappears() throws {
        // Tap the button to show the toast
        let showToastButton = app.buttons["showToastButton"]
        XCTAssertTrue(showToastButton.exists)
        showToastButton.tap()

        // Check if the toast is displayed
        let toastView = app.otherElements["toastView"]
        XCTAssertTrue(toastView.waitForExistence(timeout: 100), "Toast should appear")

        // Check if the toast text is correct
        let toastText = toastView.staticTexts["toastText"]
        XCTAssertEqual(toastText.label, "Announcement text")

        // Check if the toast action button is displayed
        let toastActionButton = toastView.buttons["toastActionButton"]
        XCTAssertTrue(toastActionButton.exists)

        // Tap the close button on the toast
        let toastCloseButton = toastView.buttons["toastCloseButton"]
        XCTAssertTrue(toastCloseButton.exists)
        toastCloseButton.tap()

        // Verify that the toast is dismissed
        XCTAssertFalse(toastView.exists, "Toast should disappear")
    }
}


//final class ContentView_UITests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
//}
