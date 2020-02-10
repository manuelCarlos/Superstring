//
//  StrikethroughTests.swift
//  SuperstringTests
//
//  Created by manuel on 10.02.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

class StrikethroughTests: XCTestCase {

    private var expected: NSMutableAttributedString!

    override func setUp() {
        expected = NSMutableAttributedString(string: "Super string!")
    }

    override func tearDown() {
        expected = nil

        super.tearDown()
    }

    func test_strikethrough_thick() {
        expected.addAttributes([.strikethroughColor: Color.red,
                                .strikethroughStyle: NSUnderlineStyle.thick.rawValue],
                               range:  NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .strikethrough(.thick)
            .strikethrough(color: .red)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_strikethrough_by_applying_value() {
        expected.addAttributes([.strikethroughStyle: NSUnderlineStyle.thick.rawValue],
                               range:  NSRange(0 ..< expected.length))

        let result = AString("Super string!")

        XCTAssertEqual(expected, result.applying([.strikethroughStyle: NSUnderlineStyle.thick.rawValue]).attributedString)
    }

    func test_strikethrough_in_super_string() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .strikethroughStyle: NSUnderlineStyle.thick.rawValue], range:  NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("Super string!")
                .backgroundColor(.red)
                .strikethrough(.thick)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_strikethrough_thick", test_strikethrough_thick),
        ("test_strikethrough_by_applying_value", test_strikethrough_by_applying_value),
        ("test_strikethrough_in_super_string", test_strikethrough_in_super_string)
    ]
}
