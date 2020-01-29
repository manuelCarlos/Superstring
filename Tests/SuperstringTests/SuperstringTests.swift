import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class SuperstringTests: XCTestCase {
    
    func test_single_superstring_with_one_attribute() {
        let expected = NSAttributedString(string: "Hello Superstring",
                                          attributes: [.backgroundColor: Color.red])
        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
        }
        
        XCTAssertTrue(result.attributedString.isEqual(expected))
    }
    
    func test_superstring_with_two_strings() {
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
    
    func test_superstring_with_newline_and_two_strings() {
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
    
    func test_superstring_ending_with_newline() {
        let expected = NSMutableAttributedString(string: "Hello Superstring", attributes: [.backgroundColor: Color.red])
        expected.append(NSAttributedString(string: "\n"))
        
        let result = Superstring {
            AString("Hello Superstring")
                .backgroundColor(.red)
            Newline()
        }
        
        XCTAssertTrue(result.attributedString.isEqual(expected))
    }
    
    func test_superstring_with_single_newline() {
        let expected = NSAttributedString(string: "\n", attributes: [.font: UIFont.systemFont(ofSize: 72)])
        
        let result = Superstring {
            Newline()
            .font(UIFont.systemFont(ofSize: 72))
        }
        
        XCTAssertTrue(result.attributedString.isEqual(expected))
    }
    
    static var allTests = [
        ("test_single_superstring_with_one_attribute", test_single_superstring_with_one_attribute),
        ("test_superstring_with_two_strings", test_superstring_with_two_strings),
        ("test_superstring_with_newline_and_two_strings", test_superstring_with_newline_and_two_strings),
        ("test_superstring_ending_with_newline", test_superstring_ending_with_newline),
        ("test_superstring_with_single_newline", test_superstring_with_single_newline)
    ]
}
