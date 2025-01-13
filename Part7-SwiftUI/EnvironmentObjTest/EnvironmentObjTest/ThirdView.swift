//
//  ThirdView.swift
//  EnvironmentObjTest
//
//  Created by AhnDeokWoo on 1/9/25.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var userProfile: UserProfileSetting
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Current Age: \(userProfile.age)")
            
            Text("Third View")
            
            Button {
                userProfile.haveBirthDayParty()
            } label: {
                Text("Having Birthday Party")
            }
        }
        .navigationTitle("Third View")
    }
}

#Preview {
    ThirdView().environmentObject(UserProfileSetting())
}
