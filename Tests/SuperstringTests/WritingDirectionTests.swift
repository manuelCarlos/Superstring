//
//  WritingDirectionTests.swift
//  SuperstringTests
//
//  Created by manuel on 13.02.20.
//

import XCTest

@testable import Superstring

final class WritingDirectionTests: XCTestCase {

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

    func test_writingDirection() {
        expected.addAttributes([.writingDirection: NSWritingDirection.rightToLeft.rawValue],
                               range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .writingDirection(.rightToLeft)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_writingDirection_by_applying_value() {
        expected.addAttributes([.writingDirection: NSWritingDirection.natural.rawValue],
                               range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")

        XCTAssertEqual(expected, result.applying([.writingDirection: NSWritingDirection.natural.rawValue]).attributedString)
    }

    func test_writingDirection_in_super_string() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .writingDirection: NSWritingDirection.rightToLeft.rawValue],
                               range: NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("Super string!")
                .backgroundColor(.red)
                .writingDirection(.rightToLeft)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_writingDirection", test_writingDirection),
        ("test_writingDirection_by_applying_value", test_writingDirection_by_applying_value),
        ("test_writingDirection_in_super_string", test_writingDirection_in_super_string)
    ]
}
