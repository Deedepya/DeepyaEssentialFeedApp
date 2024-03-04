//
//  RemoteFeedLoaderTests.swift
//  EssentialFeediOSAppTests
//
//  Created by dedeepya reddy salla on 03/03/24.
//

import XCTest

class RemoteFeedLoader {
    
    let url: URL
    let client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load(client: HTTPClient) {
        client.get(fromUrl: url)
    }
}

protocol HTTPClient {
    func get(fromUrl url: URL?)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(fromUrl url: URL?) {
        requestedURL = url
    }
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestURL() {
        let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let (sut, client) = makeSUT(url: URL(string: "https://apiurl")!)
        sut.load(client: client)
        XCTAssertNotNil(client.requestedURL)
    }
    
    func makeSUT(url: URL = URL(string: "https://www.google.com/?client=safari")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let loader = RemoteFeedLoader(url: url, client: client)
        
        return (loader, client)
    }
}
