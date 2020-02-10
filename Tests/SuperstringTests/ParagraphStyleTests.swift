//
//  ParagraphStyleTests.swift
//  SuperstringTests
//
//  Created by manuel on 10.02.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class ParagraphStyleTests: XCTestCase {

    // MARK: - Tests
    
    func test_paragraph_style() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3.0
        let expected = NSAttributedString(string: "A beautiful",
                                          attributes: [.backgroundColor: Color.red,
                                                       .paragraphStyle: style])

        let result = AString("A beautiful")
            .backgroundColor(.red)
            .paragraphStyle(style)

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_paragraph_by_applying_style() {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 3.0
        let expected = NSAttributedString(string: "A beautiful",
                                          attributes: [.backgroundColor: Color.red,
                                                       .paragraphStyle: paragraph])

        let result = AString("A beautiful")
            .backgroundColor(.red)

        XCTAssertEqual(expected, result.applying([.paragraphStyle: paragraph]).attributedString)
    }

    func test_paragraph_style_in_super_string() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3.0
        let expected = NSAttributedString(string: "A beautiful",
                                          attributes: [.backgroundColor: Color.red,
                                                       .paragraphStyle: style])

        let result = Superstring {
            AString("A beautiful")
                .backgroundColor(.red)
                .paragraphStyle(style)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_paragraph_style", test_paragraph_style),
        ("test_paragraph_by_applying_style", test_paragraph_by_applying_style),
        ("test_paragraph_style_in_super_string", test_paragraph_style_in_super_string)
    ]

}
