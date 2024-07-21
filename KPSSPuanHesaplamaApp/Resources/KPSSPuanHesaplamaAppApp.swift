//
//  KPSSPuanHesaplamaAppApp.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

@main
struct KPSSPuanHesaplamaAppApp: App {
    
    init(){
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        UITabBar.appearance().standardAppearance = appearanceTab
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Result.self)
    }
}
