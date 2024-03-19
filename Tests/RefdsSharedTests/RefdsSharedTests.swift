import XCTest
@testable import RefdsShared

final class RefdsSharedTests: XCTestCase {
    func testArrayInsertionIndexOf() {
        let array = [1, 2, 4, 5, 6]
        let position = array.insertionIndexOf(3, isOrderedBefore: { $0 < $1 })
        XCTAssertEqual(position, 2)
    }
    
    func testArraySafeAccessIndex() {
        let array = [1, 2, 3]
        XCTAssertNil(array[safe: 3])
        XCTAssertNotNil(array[safe: 1])
    }
    
    func testCalendarGenerateDates() {
        let start = Date(timeIntervalSince1970: 1709963516)
        let end = Date(timeIntervalSince1970: 1710827516)
        let dates = Calendar.current.generateDates(
            inside: .init(start: start, end: end),
            matching: .init(hour: 8)
        )
        XCTAssertTrue(dates.isEmpty != true)
    }
    
    func testClosedRange() {
        let range = ClosedRange<Int>.range(page: 1, amount: 30, count: 4)
        XCTAssertEqual(range?.count, 4)
    }
    
    func testDataAsModel() {
        let data = String.someWord().asData
        let model: String? = data?.asModel()
        XCTAssertEqual(model?.isEmpty, false)
    }
    
    func testDataAsModelWithDate() {
        let data = String.someWord().asData
        let model: String? = data?.asModel(dateFormat: .monthYear)
        XCTAssertEqual(model?.isEmpty, false)
    }
    
    func testDateExtensions() {
        let date: Date = .current
        let dateString = date.asString()
        let timeInterval = date.timestamp
        let timeIntervalString = timeInterval.asString()
        XCTAssertTrue(!dateString.isEmpty)
        XCTAssertTrue(!timeIntervalString.isEmpty)
    }
    
    func testDoubleExtensions() {
        let value: Double = 123_456.789
        let rounded = value.rounded(toPlaces: 1)
        let reducedScale = rounded.reduceScale(to: 2)
        let currency = reducedScale.currency()
        let distance = reducedScale.distance
        let formatted = reducedScale.currency(code: nil)
        XCTAssertTrue(!currency.isEmpty)
        XCTAssertTrue(!distance.isEmpty)
        XCTAssertTrue(!formatted.isEmpty)
    }
    
    func testEncodableMessage() {
        let string = String.someWord()
        let message = string.message
        XCTAssertTrue(!message.isEmpty)
    }
    
    func testEncodableCSV() {
        let string = String.someWord()
        let _ = string.asCSV
        let newValue = [["Number 1": 1, "Number 2": 2], ["Number 1": 3, "Number 2": 4]]
        let newCSV = newValue.asCSV
        XCTAssertTrue(newCSV?.isEmpty == false)
    }
    
    func testIntLetter() {
        let int: Int = 10
        let letter = int.letter
        XCTAssertFalse(letter.isEmpty)
    }
    
    func testStringExtensions() {
        var value = String.someParagraph()
        value = .someWord()
        let date = "01/01/2024".asDate(withFormat: .dayMonthYear)
        let dateString = date?.asString(withDateFormat: .weekMonthYear)
        let weekDate = dateString?.asDate(withFormat: .weekMonthYear)
        let customDate = "01/01/2024".asDate(withFormat: .custom("dd/MM/yyyy"))
        let md5 = value.asMD5
        let double = "1.5".asDouble
        let currencyDouble = "100.000,00".asDouble
        let int = "2".asInt
        
        XCTAssertEqual(value.isEmpty, false)
        XCTAssertEqual(md5.isEmpty, false)
        XCTAssertEqual(double, 1.5)
        XCTAssertEqual(currencyDouble, 100000.0)
        XCTAssertEqual(int, 2)
        XCTAssertTrue(date != nil)
        XCTAssertTrue(weekDate != nil)
        XCTAssertTrue(customDate != nil)
    }
    
    func testURLExtensions() {
        let url = try? URL.storeURL(for: "default.group", databaseName: "default")
        let otherURL = try? URL.storeURL(for: "", databaseName: "")
        XCTAssertNotNil(url)
        XCTAssertNil(otherURL)
    }
    
    func testRandomText() {
        RefdsRandomText.allCases.forEach { randomText in
            let _ = randomText.words
            let _ = randomText.paragraphs
        }
    }
    
    func testRefdsLogger() {
        RefdsLoggerSystem.shared.error(bundle: "", message: "")
        RefdsLoggerSystem.shared.info(bundle: "", message: "")
    }
    
    func testRefdsModel() {
        let model = RefdsModelMock()
        model.logger.error(bundle: "", message: "")
    }
    
    func testRefdsError() {
        let error1 = RefdsError.requestError(error: NSError(domain: "", code: 1))
        let error2 = RefdsError.notFound(type: String.self)
        let error3 = RefdsError.encodedError(type: RefdsModelMock.self)
        let error4 = RefdsError.decodedError(type: RefdsModelMock.self)
        let error5 = RefdsError.custom(message: "")
        let error6 = RefdsError.custom(message: "")
        
        XCTAssertFalse(error1.description.isEmpty)
        XCTAssertFalse(error2.description.isEmpty)
        XCTAssertFalse(error3.description.isEmpty)
        XCTAssertFalse(error4.description.isEmpty)
        XCTAssertFalse(error5.description.isEmpty)
        XCTAssertEqual(error5, error6)
    }
}
