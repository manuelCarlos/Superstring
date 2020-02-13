//
//  StrokeTests.swift
//  SuperstringTests
//
//  Created by manuel on 13.02.20.
//

import XCTest

@testable import Superstring

final class StrokeTests: XCTestCase {

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

    func test_stroke_width_color() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .strokeWidth: 10,
                                .strokeColor: Color.red], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .backgroundColor(.red)
            .strokeColor(.red)
            .strokeWidth(10)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_stroke_by_applying_value() {
        expected.addAttributes([.strokeWidth: 10], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")

        XCTAssertEqual(expected, result.applying([.strokeWidth: 10]).attributedString)
    }

    func test_stroke_in_super_string() {
        expected.addAttributes([.strokeWidth: 10,
                                .strokeColor: Color.red], range: NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("Super string!")
                .strokeColor(.red)
                .strokeWidth(10)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_stroke_width_color", test_stroke_width_color),
        ("test_stroke_by_applying_value", test_stroke_by_applying_value),
        ("test_stroke_in_super_string", test_stroke_in_super_string)
    ]
}
