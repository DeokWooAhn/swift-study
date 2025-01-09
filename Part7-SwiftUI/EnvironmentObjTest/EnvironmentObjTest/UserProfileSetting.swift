//
//  UserProfileSetting.swift
//  EnvironmentObjTest
//
//  Created by AhnDeokWoo on 1/9/25.
//

import Foundation

final class UserProfileSetting: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthDayParty() {
        age += 1
    }
}
