//
//  ContentView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct RootView: View {
    @State private var selectionItem = 0
    var body: some View {
        TabView(selection: $selectionItem){
            MainView()
                .tabItem {
                    Label("Başlangıç", systemImage: "house")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill : .none)
                }
                .tag(0)
            
            ResultView()
                .tabItem {
                    Label("Hesaplamalar",systemImage: "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 1 ? .fill : .none)
                }
                .tag(1)
        }
        .tint(.black) //tab viewdaki iconların rengini değiştirir.
    }
}

#Preview {
    RootView()
}
