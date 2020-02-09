import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class SuperstringTests: XCTestCase {

    func test_super_string() {
        let expected = NSAttributedString(string: "Hello Superstring")
        let result = Superstring {
            AString("Hello Superstring")
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_one_attribute() {
        let expected = NSAttributedString(string: "Hello Superstring",
                                          attributes: [.backgroundColor: Color.red])
        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_two_AString() {
        let expected = NSMutableAttributedString(string: "Hello Superstring",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .foregroundColor: Color.cyan])
        expected.append(NSAttributedString(string: "I looked at clouds"))
        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
                .foregroundColor(.cyan)
            AString("I looked at clouds")
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_newline_and_two_AStrings() {
        let expected = NSMutableAttributedString(string: "Hello Superstring",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .foregroundColor: Color.cyan])
        expected.append(NSAttributedString(string: "\nI looked at clouds"))
        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
                .foregroundColor(.cyan)
            Newline()
            AString("I looked at clouds")
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_ending_with_Newline() {
        let expected = NSMutableAttributedString(string: "Hello Superstring", attributes: [.backgroundColor: Color.red])
        expected.append(NSAttributedString(string: "\n"))

        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
            Newline()
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    func test_super_string_with_single_Newline() {
        let expected = NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 72)])

        let result = Superstring {
            Newline()
            .font(UIFont.systemFont(ofSize: 72))
        }

        XCTAssertEqual(expected, result.attributedString)
    }

    static var allTests = [
        ("test_super_string", test_super_string),
        ("test_super_string_with_one_attribute", test_super_string_with_one_attribute),
        ("test_super_string_with_two_AString", test_super_string_with_two_AString),
        ("test_super_string_with_newline_and_two_AStrings", test_super_string_with_newline_and_two_AStrings),
        ("test_super_string_ending_with_Newline", test_super_string_ending_with_Newline),
        ("test_super_string_with_single_Newline", test_super_string_with_single_Newline)
    ]
}
