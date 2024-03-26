//
//  RemoteFeedLoader.swift
//  EssentialFeediOSApp
//
//  Created by dedeepya reddy salla on 26/03/24.
//

import Foundation

public protocol HTTPClient {
    func get(fromUrl url: URL?)
}


public final class RemoteFeedLoader {
    
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(fromUrl: url)
    }
}

