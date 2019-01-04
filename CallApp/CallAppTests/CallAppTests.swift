//
//  CallAppTests.swift
//  CallAppTests
//
//  Created by Hemanth Prasad on 1/3/19.
//  Copyright © 2019 Hemanth Prasad. All rights reserved.
//

import XCTest
@testable import CallApp

class CallAppTests: XCTestCase {

    func testExample() {
        XCTAssertEqual(NumberFormatter.formatNumber(number: ["2","1","3"]), "213")
        XCTAssertEqual(NumberFormatter.formatNumber(number: ["2","1","3","3"]), "213-3")
        XCTAssertEqual(NumberFormatter.formatNumber(number: ["2","1","3","3","4","4"]), "213-344")
        XCTAssertEqual(NumberFormatter.formatNumber(number: ["2","1","3","3","4","4","5","6"]), "(213) 344-56")
        XCTAssertEqual(NumberFormatter.formatNumber(number: ["2","1","3","3","4","4","5","6","7","8"]), "(213) 344-5678")
        XCTAssertEqual(NumberFormatter.formatNumber(number: ["2","1","3","3","4","4","5","6","7","8","9","9"]), "213344567899")

    }
}
