import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(gloomhaven_scrapTests.allTests),
    ]
}
#endif