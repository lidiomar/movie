//
//  RemoteMovieLoader.swift
//  MovieTests
//
//  Created by Lidiomar Machado on 28/02/22.
//

import Foundation
import XCTest
import Movie

class RemoteMovieLoaderTest: XCTestCase {
    
    func test_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_requestDataFromURLOnLoad() {
        let (sut, client) = makeSUT()
        
        sut.load()
        
        XCTAssertFalse(client.requestedURLs.isEmpty)
    }
    
    func test_loadURLtwice_requestDataFromURLTwice() {
        let url = URL(string: "https://a-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (RemoteMovieLoader, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteMovieLoader(client: client, url: url)
        
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        
        func get(url: URL) {
            self.requestedURLs.append(url)
        }
    }
}
