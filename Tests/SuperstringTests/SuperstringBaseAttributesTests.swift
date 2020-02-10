//
//  SuperstringBaseAttributesTests.swift
//  SuperstringTests
//
//  Created by manuel on 07.02.20.
//

import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class SuperstringBaseAttributesTests: XCTestCase {

    // MARK: - Tests
    
    func test_super_string_with_one_base_attribute() {
        let expected = NSMutableAttributedString(string: "A beautiful ",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .font: Font.systemFont(ofSize: 66)])
        expected.append(NSAttributedString(string: "World",
                                           attributes: [.backgroundColor: Color.cyan,
                                                        .font: Font.systemFont(ofSize: 66)]))

        let baseAttributes: Attributes = [.font: Font.systemFont(ofSize: 66)]

        let result = Superstring(baseAttributes) {
            AString("A beautiful ")
                .backgroundColor(.red)
            AString("World")
                .backgroundColor(.cyan)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_base_attributes_override() {
        let baseAttributes = [NSAttributedString.Key.backgroundColor: Color.cyan,
                              NSAttributedString.Key.font: Font.systemFont(ofSize: 66)]

        let expected = NSMutableAttributedString(string: "A beautiful ",
                                                 attributes: baseAttributes)
        expected.append(NSAttributedString(string: "World",
                                           attributes: baseAttributes))

        let result = Superstring(baseAttributes) {
            AString("A beautiful ")
                .font(.systemFont(ofSize: 66))
            AString("World")
                .backgroundColor(.cyan)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_base_attributes() {
         let baseAttributes = [NSAttributedString.Key.backgroundColor: Color.cyan,
                               NSAttributedString.Key.font: Font.systemFont(ofSize: 66)]

         let expected = NSMutableAttributedString(string: "A beautiful ",
                                                  attributes: baseAttributes)
         expected.append(NSAttributedString(string: "World",
                                            attributes: baseAttributes))

         let result = Superstring(baseAttributes) {
             AString("A beautiful ")
             AString("World")
         }

         XCTAssertEqual(expected, result.attributedString)
     }

    func test_super_string_base_attributes_single_constructor() {
         let baseAttributes = [NSAttributedString.Key.backgroundColor: Color.cyan,
                               NSAttributedString.Key.font: Font.systemFont(ofSize: 66)]

         let expected = NSMutableAttributedString(string: "A beautiful",
                                                  attributes: baseAttributes)

         let result = Superstring(baseAttributes) {
             AString("A beautiful")
         }

         XCTAssertEqual(expected, result.attributedString)
     }

    func test_super_string_base_attributes_for_AString_and_Newline() {
        let baseAttributes = [NSAttributedString.Key.backgroundColor: Color.cyan,
                              NSAttributedString.Key.font: Font.systemFont(ofSize: 66)]

        let expected = NSMutableAttributedString(string: "A beautiful",
                                                 attributes: baseAttributes)
        expected.append(NSAttributedString(string: "\n",
                                           attributes: baseAttributes))

        let result = Superstring(baseAttributes) {
            AString("A beautiful")
            Newline()
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_no_base_attributes() {
        let expected = NSAttributedString(string: "Hello Superstring",
                                          attributes: [.backgroundColor: Color.red])
        let result = Superstring([:]) {
            AString("Hello Superstring")
                .backgroundColor(.red)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_two_AString_and_no_base_attributes() {
        let expected = NSMutableAttributedString(string: "Hello Superstring",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .foregroundColor: Color.cyan])
        expected.append(NSAttributedString(string: "I looked at clouds"))
        let result = Superstring([:]) {
            AString("Hello Superstring")
                .backgroundColor(.red)
                .foregroundColor(.cyan)
            AString("I looked at clouds")
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_newline_and_two_AStrings_and_no_base_attributes() {
        let expected = NSMutableAttributedString(string: "Hello Superstring",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .foregroundColor: Color.cyan])
        expected.append(NSAttributedString(string: "\nI looked at clouds"))
        let result = Superstring([:]) {
            AString("Hello Superstring")
                .backgroundColor(.red)
                .foregroundColor(.cyan)
            Newline()
            AString("I looked at clouds")
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_super_string_with_one_base_attribute", test_super_string_with_one_base_attribute),
        ("test_super_string_base_attributes_override", test_super_string_base_attributes_override),
        ("test_super_string_base_attributes", test_super_string_base_attributes),
        ("test_super_string_base_attributes_single_constructor", test_super_string_base_attributes_single_constructor),
        ("test_super_string_base_attributes_for_AString_and_Newline", test_super_string_base_attributes_for_AString_and_Newline),
        ("test_super_string_with_no_base_attributes", test_super_string_with_no_base_attributes),
        ("test_super_string_with_two_AString_and_no_base_attributes", test_super_string_with_two_AString_and_no_base_attributes),
        ("test_super_string_with_newline_and_two_AStrings_and_no_base_attributes", test_super_string_with_newline_and_two_AStrings_and_no_base_attributes)
    ]
    
}
