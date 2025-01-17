//
//  UserProfileViewModel.swift
//  GithubUserSearch
//
//  Created by AhnDeokWoo on 1/17/25.
//

import Foundation
import Combine

final class UserProfileViewModel: ObservableObject {
    
    let loginID: String
    
    let network: NetworkService
    
    @Published var selectedUser: UserProfile?
    
    init(network: NetworkService, loginID: String) {
        self.network = network
        self.loginID = loginID
    }
    
    var name: String {
        return selectedUser?.name ?? "n/a"
    }
    
    var login: String {
        return selectedUser?.login ?? "n/a"
    }
    
    var followers: String {
        guard let value = selectedUser?.followers else { return "" }
        return "followers: \(value)"
    }
    
    var following: String {
        guard let value = selectedUser?.following else { return "" }
        return "following: \(value)"
    }
}
