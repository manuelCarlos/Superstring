import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class SuperstringTests: XCTestCase {
    
    func test_single_superstring() {
        let expected = NSAttributedString(string: "Hello Superstring")
        let result = Superstring {
            AString("Hello Superstring")
        }

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }

    func test_single_superstring_with_one_attribute() {
        let expected = NSAttributedString(string: "Hello Superstring",
                                          attributes: [.backgroundColor: Color.red])
        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
        }

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }

    func test_superstring_with_two_AString() {
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

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }

    func test_superstring_with_newline_and_two_AStrings() {
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

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }

    func test_superstring_ending_with_Newline() {
        let expected = NSMutableAttributedString(string: "Hello Superstring", attributes: [.backgroundColor: Color.red])
        expected.append(NSAttributedString(string: "\n"))

        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
            Newline()
        }

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }
    
    func test_superstring_base_attributes() {
        let expected = NSMutableAttributedString(string: "A beautiful ",
                                                 attributes: [.backgroundColor: Color.red,
                                                              .font: Font.systemFont(ofSize: 66)])
        expected.append(NSAttributedString(string: "World",
                                           attributes: [.backgroundColor: Color.cyan,
                                                        .font: Font.systemFont(ofSize: 66)]))

        let attribs: Attributes = [.font: Font.systemFont(ofSize: 66)]

        let result = Superstring(attribs) {
            AString("A beautiful ")
                .backgroundColor(.red)
            AString("World")
                .backgroundColor(.cyan)
        }

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }

    func test_superstring_with_single_Newline() {
        let expected = NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 72)])

        let result = Superstring {
            Newline()
            .font(UIFont.systemFont(ofSize: 72))
        }

        XCTAssertTrue(result.attributedString.isEqual(expected))
    }
    
    static var allTests = [
        ("test_single_superstring_with_one_attribute", test_single_superstring_with_one_attribute),
        ("test_superstring_with_two_AString", test_superstring_with_two_AString),
        ("test_superstring_with_newline_and_two_strings", test_superstring_with_newline_and_two_AStrings),
        ("test_superstring_ending_with_newline", test_superstring_ending_with_Newline),
        ("test_superstring_base_attributes", test_superstring_base_attributes),
        ("test_superstring_with_single_newline", test_superstring_with_single_Newline),
    ]
}
