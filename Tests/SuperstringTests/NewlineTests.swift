//
//  NewlineTests.swift
//  SuperstringTests
//
//  Created by manuel on 29.01.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class NewlineTests: XCTestCase {

    // MARK: - Tests

    func test_Newline() {
        let expected = NSAttributedString(string: "\n")
        let result = Newline()

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_Newline_with_font_attribute() {
        let expected = NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 72)])

        let result = Newline()
            .font(UIFont.systemFont(ofSize: 72))

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_Newline", test_Newline),
        ("test_Newline_with_font_attribute", test_Newline_with_font_attribute)
    ]

}
