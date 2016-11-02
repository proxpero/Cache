//
//  CacheTests.swift
//  CacheTests
//
//  Created by Todd Olsen on 11/2/16.
//
//

import XCTest
@testable import Cache

final class Object: NSObject, NSCoding {

    let name: String

    init(with name: String) {
        self.name = name
    }

    init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
    }
}


class CacheTests: XCTestCase {

    func testSaveAndFetch() {

        let object1 = Object(with: "Hello")
        let cache = Cache(with: "ObjectTest")
        cache.save(object: object1)
        let object2 = cache.fetch() as? Object

        XCTAssertNotNil(object2)
        XCTAssertEqual(object1.name, object2!.name)

    }

}
