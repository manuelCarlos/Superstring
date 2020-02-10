//
//  LigatureTests.swift
//  SuperstringTests
//
//  Created by manuel on 10.02.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class LigatureTests: XCTestCase {

    // MARK: - Setup

    private var expected: NSMutableAttributedString!

    override func setUp() {
        expected = NSMutableAttributedString(string: "A beautiful")
    }

    override func tearDown() {
        expected = nil

        super.tearDown()
    }

    // MARK: - Tests

    func test_ligature_zero() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .ligature: 0], range: NSRange(0 ..< expected.length))

        let result = AString("A beautiful")
            .backgroundColor(.red)
            .ligature(.none)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_ligature_default() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .ligature: 1], range: NSRange(0 ..< expected.length))

        let result = AString("A beautiful")
            .backgroundColor(.red)
            .ligature(.default)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_ligature_by_applying_value() {
        expected.addAttributes([.ligature: 1], range: NSRange(0 ..< expected.length))

        let result = AString("A beautiful")

        XCTAssertEqual(expected, result.applying([.ligature: Ligature.default.rawValue]).attributedString)
    }

    func test_ligature_in_super_string() {
        expected.addAttributes([.backgroundColor: Color.red,
                                .ligature: 1], range: NSRange(0 ..< expected.length))

        let result = Superstring {
            AString("A beautiful")
                .backgroundColor(.red)
                .ligature(.default)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_ligature_zero", test_ligature_zero),
        ("test_ligature_default", test_ligature_default),
        ("test_ligature_by_applying_value", test_ligature_by_applying_value),
        ("test_ligature_in_super_string", test_ligature_in_super_string)
    ]

}
