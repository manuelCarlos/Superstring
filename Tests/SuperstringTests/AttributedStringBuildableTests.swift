//
//  AttributedStringBuildableTests.swift
//  SuperstringTests
//
//  Created by manuel on 09.02.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class AttributedStringBuildableTests: XCTestCase {

    func test_font() {
        let expected = NSAttributedString(string: "A beautiful ",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .font: Font.systemFont(ofSize: 66)])

        let string = AString("A beautiful ")
            .backgroundColor(.red)

        let result = string.font(.systemFont(ofSize: 66))
        XCTAssertEqual(expected, result.attributedString)
    }


    func test_paragraph_style() {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 3.0
        let expected = NSAttributedString(string: "A beautiful",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .paragraphStyle: paragraph])

        let result = AString("A beautiful")
            .backgroundColor(.red)
            .paragraphStyle(paragraph)

        XCTAssertEqual(expected, result.attributedString)
    }


}
