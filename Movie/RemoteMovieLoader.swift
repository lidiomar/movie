//
//  RemoteMovieLoader.swift
//  Movie
//
//  Created by Lidiomar Machado on 28/02/22.
//

import Foundation

public protocol HTTPClient {
    func get(url: URL)
}

public final class RemoteMovieLoader {
    private let client: HTTPClient
    private let url: URL
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load() {
        client.get(url: self.url)
    }
}
