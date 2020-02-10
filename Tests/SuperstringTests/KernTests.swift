//
//  KernTests.swift
//  SuperstringTests
//
//  Created by manuel on 10.02.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class KernTests: XCTestCase {

    private var expected: NSMutableAttributedString!

    override func setUp() {
        expected = NSMutableAttributedString(string: "Super string!")
    }

    override func tearDown() {
        expected = nil

        super.tearDown()
    }

    func test_kern_zero() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .kern: 0], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .backgroundColor(.red)
            .kern(0)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_kern_default() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .kern: 1.5], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")
            .backgroundColor(.red)
            .kern(1.5)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_kern_by_applying_value() {
        expected.addAttributes([.kern: 4.5], range: NSRange(0 ..< expected.length))

        let result = AString("Super string!")

        XCTAssertEqual(expected, result.applying([.kern: 4.5]).attributedString)
    }

    func test_kern_in_super_string() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .kern: 1.5], range: NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("Super string!")
                .backgroundColor(.red)
                .kern(1.5)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_kern_zero", test_kern_zero),
        ("test_kern_default", test_kern_default),
        ("test_kern_by_applying_value", test_kern_by_applying_value),
        ("test_kern_in_super_string", test_kern_in_super_string)
    ]

}
