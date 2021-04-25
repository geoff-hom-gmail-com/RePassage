//
//  RePassageUITests.swift
//  RePassageUITests
//
//  Created by Geoff Hom on 4/15/21.
//

import XCTest

public enum Texts: String {
  case helloWorld = "Hello, world!"
}

class RePassageUITests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the
    // class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation -
    // required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the
    // class.
  }

  func testExample() throws {
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()

    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testHelloWorldText() throws {
    let app = XCUIApplication()
    app.launch()
    // TODO: consider moving app launch to setup? except testLaunchPerformance doesn't use that?
    // look up the measure() function and XCTApplicationLaunchMetric()
    XCTAssertTrue(app.staticTexts[Texts.helloWorld.rawValue].exists)
  }

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
