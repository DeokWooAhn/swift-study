//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        // Grid 만들기
        // - UIKit : UICollectionView
        //   - Data, Presentaion, Layout
        // - SwiftUI : LazyVGrid, LazyHGrid
        //   - ✅ Data, ✅ Presentaion, ✅ Layout
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach($viewModel.models) { $item in
                        FrameworkCell(framework: $item)
                            .onTapGesture {
                                viewModel.isShowingDetail = true
                                viewModel.selectedItem = item
                            }
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        .sheet(isPresented: $viewModel.isShowingDetail) {
            let vm = FrameworkDetailViewModel(framework: viewModel.selectedItem!)
            FrameworkDetailView(viewModel: vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}
