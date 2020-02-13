//
//  UnderlineTests.swift
//  SuperstringTests
//
//  Created by manuel on 13.02.20.
//

import XCTest

@testable import Superstring

final class UnderlineTests: XCTestCase {

    // MARK: - Setup

    private var expected: NSMutableAttributedString!

    override func setUp() {
        expected = NSMutableAttributedString(string: "Super string!")
    }

    override func tearDown() {
        expected = nil

        super.tearDown()
    }

    // MARK: - Tests

    func test_underline_style_color() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .underlineStyle: NSUnderlineStyle.patternDash.rawValue,
                                .underlineColor: Color.red], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .backgroundColor(.red)
            .underlineColor(.red)
            .underlineStyle(.patternDash)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_underline_by_applying_value() {
        expected.addAttributes([.underlineStyle: NSUnderlineStyle.patternDash.rawValue], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")

        XCTAssertEqual(expected, result.applying([.underlineStyle: NSUnderlineStyle.patternDash.rawValue]).attributedString)
    }

    func test_underline_in_super_string() {
        expected.addAttributes([.underlineStyle: NSUnderlineStyle.patternDash.rawValue,
                                .kern: 1.5], range: NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("Super string!")
                .underlineStyle(.patternDash)
                .kern(1.5)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_underline_style_color", test_underline_style_color),
        ("test_underline_by_applying_value", test_underline_by_applying_value),
        ("test_underline_in_super_string", test_underline_in_super_string)
    ]

}
