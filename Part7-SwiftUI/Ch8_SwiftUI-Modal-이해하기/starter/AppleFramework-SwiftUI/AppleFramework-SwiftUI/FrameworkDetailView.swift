//
//  FrameworkDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by AhnDeokWoo on 1/13/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @Binding var framework: AppleFramework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
            Text(framework.name)
            Text(framework.description)
            
            Button {
                
            } label: {
                Text("Button")
            }
        }
    }
}

#Preview {
    FrameworkDetailView(framework: .constant(AppleFramework.list[0]))
}
