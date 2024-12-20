//
//  SearchViewModel.swift
//  GithubUserSearch
//
//  Created by AhnDeokWoo on 12/4/24.
//

import Foundation
import Combine

final class SearchViewModel {
    let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    // Data -> Output
//    @Published private(set) var users = [SearchResult]()
    let users = CurrentValueSubject<[SearchResult], Never>([])
    
    // User -> Input
    func search(keyword: String) {
        let resource: Resource<SearchUserResponse> = Resource(
            base: "https://api.github.com/",
            path: "search/users",
            params: ["q": keyword],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] items in
                self?.users.send(items)
            })
            .store(in: &subscriptions)
    }
}
