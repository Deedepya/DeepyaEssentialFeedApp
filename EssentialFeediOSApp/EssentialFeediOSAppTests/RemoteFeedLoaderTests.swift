//
//  RemoteFeedLoaderTests.swift
//  EssentialFeediOSAppTests
//
//  Created by dedeepya reddy salla on 03/03/24.
//

import XCTest

class RemoteFeedLoader {
    func load(client: HTTPClient) {
        client.get(fromUrl: URL(string: "https://www.google.com/?client=safari"))
    }
}

class HTTPClient {
    func get(fromUrl url: URL?) {
    }
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(fromUrl url: URL?) {
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader()
        sut.load(client: client)
        XCTAssertNotNil(client.requestedURL)
    }
}
