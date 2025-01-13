//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by AhnDeokWoo on 1/13/25.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
}
