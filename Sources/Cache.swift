//
//  Cache.swift
//  Cache
//
//  Created by Todd Olsen on 11/1/16.
//
//

import Foundation

public final class Cache {

    public let name: String

    init(with name: String) {
        self.name = name
    }

    private static var _enabled = true

    static func enable() {
        _enabled = true
    }

    static func disable() {
        _enabled = false
    }

    var hashedName: String {
        return String(name.hashValue)
    }

    var cacheFilename: URL {
        return URL(fileURLWithPath: hashedName).appendingPathComponent("cache")
    }

    var appCacheDirectory: URL {
        let directory = FileManager.SearchPathDirectory.cachesDirectory
        let mask = FileManager.SearchPathDomainMask.userDomainMask
        guard let url = FileManager.default.urls(for: directory, in: mask).first else { fatalError() }
        return url
    }

    var cacheLocation: URL {
        return appCacheDirectory
            .appendingPathComponent(appCacheDirectory.path, isDirectory: true)
            .appendingPathComponent("caches")
            .appendingPathComponent(cacheFilename.path)
    }

    func save(object: NSCoding) {
        NSKeyedArchiver.archiveRootObject(object, toFile: cacheLocation.path)
    }

    func fetch() -> NSCoding {
        guard let object = NSKeyedUnarchiver.unarchiveObject(withFile: cacheLocation.path) as? NSCoding else { fatalError() }
        return object
    }


}
