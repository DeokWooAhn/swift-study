//
//  UserProfileView.swift
//  GithubUserSearch
//
//  Created by AhnDeokWoo on 1/17/25.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack {
            Image("")
                .frame(width: 160, height: 160)
                .background(.gray)
                .cornerRadius(80)
            
            Text(viewModel.name)
            Text(viewModel.login)
            Text(viewModel.followers)
            Text(viewModel.following)
        }
    }
}

#Preview {
    UserProfileView(viewModel: UserProfileViewModel(network: NetworkService(configuration: .default), loginID: "cafielo"))
}
