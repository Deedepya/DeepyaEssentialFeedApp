//
//  RemoteFeedLoaderTests.swift
//  EssentialFeediOSAppTests
//
//  Created by dedeepya reddy salla on 03/03/24.
//

import XCTest
import EssentialFeediOSApp


final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://apiurl")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
//        XCTAssertNotNil(client.requestedURL)
    }
    
    func makeSUT(url: URL = URL(string: "https://www.google.com/?client=safari")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(fromUrl url: URL?) {
            requestedURL = url
        }
    }
}
