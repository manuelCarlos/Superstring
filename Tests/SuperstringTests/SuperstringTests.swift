import XCTest
@testable import Superstring

final class SuperstringTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Superstring().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
