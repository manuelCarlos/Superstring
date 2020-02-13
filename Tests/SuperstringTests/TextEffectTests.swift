//
//  TextEffectTests.swift
//  SuperstringTests
//
//  Created by manuel on 13.02.20.
//

import XCTest

@testable import Superstring

final class TextEffectTests: XCTestCase {

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

    func test_textEffect() {
        expected.addAttributes([.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle],
                               range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .textEffect(.letterpressStyle)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_textEffect_by_applying_value() {
        expected.addAttributes([.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle],
                               range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")

        XCTAssertEqual(expected, result.applying([.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle]).attributedString)
    }

    func test_textEffect_in_super_string() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle],
                               range: NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("Super string!")
                .backgroundColor(.red)
                .textEffect(.letterpressStyle)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_textEffect", test_textEffect),
        ("test_textEffect_by_applying_value", test_textEffect_by_applying_value),
        ("test_textEffect_in_super_string", test_textEffect_in_super_string)
    ]

}
