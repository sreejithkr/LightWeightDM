import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LightWeightDMTests.allTests),
    ]
}
#endif
