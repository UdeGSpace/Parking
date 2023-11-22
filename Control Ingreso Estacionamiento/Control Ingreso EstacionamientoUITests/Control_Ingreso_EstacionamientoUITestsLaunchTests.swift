//
//  Control_Ingreso_EstacionamientoUITestsLaunchTests.swift
//  Control Ingreso EstacionamientoUITests
//
//  Created by Sergio Sanchez Roldan on 06/11/23.
//

import XCTest

final class Control_Ingreso_EstacionamientoUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
