//
//  FrameworkDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by AhnDeokWoo on 1/13/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @StateObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            Image(viewModel.framework.imageName)
            Text(viewModel.framework.name)
            Text(viewModel.framework.description)
            
            Button {
                
            } label: {
                Text("Button")
            }
        }
    }
}

#Preview {
    let vm = FrameworkDetailViewModel(framework: AppleFramework.list[0])
    FrameworkDetailView(viewModel: vm)
}
