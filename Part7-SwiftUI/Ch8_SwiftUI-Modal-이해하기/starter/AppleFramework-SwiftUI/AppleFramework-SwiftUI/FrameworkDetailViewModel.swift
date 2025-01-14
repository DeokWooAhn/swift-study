//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by AhnDeokWoo on 1/14/25.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
