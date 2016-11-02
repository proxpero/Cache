//
//  CacheTests.swift
//  CacheTests
//
//  Created by Todd Olsen on 11/2/16.
//
//

import XCTest
@testable import Cache

class CacheTests: XCTestCase {

    func testSave() {

        let cache = Cache(with: "name", directory: .documentDirectory)
        try! FileManager.default.removeItem(at: cache.cacheLocation)

        let hello = "hello, "
        XCTAssertTrue(cache.save(object: hello as NSCoding))
        XCTAssertTrue(FileManager.default.fileExists(atPath: cache.cacheLocation.path))

        let world = "world!"
        XCTAssertTrue(cache.save(object: world as NSCoding))
        XCTAssertTrue(FileManager.default.fileExists(atPath: cache.cacheLocation.path))

    }

    func testSaveAndFetch() {

        let hello = "hello"
        let cache = Cache(with: "name", directory: .documentDirectory)
        let success = cache.save(object: hello as NSCoding)
        XCTAssertTrue(success)

        let result = cache.fetch() as! String
        XCTAssertEqual(hello, result)

    }

    func testReconstructedCache() {

        let hello = "hello"
        let name = "name"
        let c1 = Cache(with: name, directory: .documentDirectory)
        let success = c1.save(object: hello as NSCoding)
        XCTAssertTrue(success)

        let c2 = Cache(with: name, directory: .documentDirectory)
        let result = c2.fetch() as! String
        XCTAssertEqual(hello, result)

    }

    func testCacheObject() {

        let name = "hello"
        let numbers = [2, 3, 5, 7, 11]
        let data = name.data(using: .utf8)!

        let object = Object(with: name, numbers: numbers, asset: data)
        let cache = Cache(with: "name", directory: .documentDirectory)
        let success = cache.save(object: object)
        XCTAssertTrue(success)

        let result = cache.fetch() as! Object
        XCTAssertEqual("hello", result.name)
    }

}
