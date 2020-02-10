//
//  AStringTests.swift
//  SuperstringTests
//
//  Created by manuel on 28.01.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class AStringTests: XCTestCase {

    func test_AString() {
        let expected = NSAttributedString(string: "Superstring")
        let result = AString("Superstring")

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_AString_with_red_background_color() {
        let expected = NSAttributedString(string: "Hello Superstring",
                                          attributes: [.backgroundColor: Color.red])
        let result = AString("Hello Superstring").backgroundColor(.red)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_AString_with_multiple_attributes() {
        let expected = NSAttributedString(string: "Hello Superstring",
                                          attributes: [.backgroundColor: Color.red,
                                                       .foregroundColor: Color.cyan
        ])
        let result = AString("Hello Superstring")
            .backgroundColor(.red)
            .foregroundColor(.cyan)

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_AString", test_AString),
        ("test_AString_with_red_background_color", test_AString_with_red_background_color),
        ("test_AString_with_multiple_attributes", test_AString_with_multiple_attributes)
    ]
}
