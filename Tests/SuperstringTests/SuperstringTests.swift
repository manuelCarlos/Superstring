import XCTest

#if canImport(UIKit)
import UIKit
#endif

@testable import Superstring

final class SuperstringTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let attributedString = NSAttributedString {
            AString("Hello, ")
                .font(.systemFont(ofSize: 24))
                .foregroundColor(.red)
                .backgroundColor(.brown)
            AString("World!")
                .font(.systemFont(ofSize: 20))
                .foregroundColor(.darkGray)
        }
        
        XCTAssertEqual(attributedString.string, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
