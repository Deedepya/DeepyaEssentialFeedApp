//
//  FeedLoader.swift
//  EssentialFeediOSApp
//
//  Created by dedeepya reddy salla on 03/03/24.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
