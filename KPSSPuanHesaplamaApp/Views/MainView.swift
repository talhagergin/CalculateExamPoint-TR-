//
//  MainView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    Section{
                        NavigationLink(destination: OrtaogretimView()) {
                            HStack{
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Ortaöğretim")
                                    .badge(
                                        Text("P94")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: OnlisansView()) {
                            HStack{
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Önlisans")
                                    .badge(
                                        Text("P93")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: LisansView()) {
                            HStack{
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Lisans (B Grubu)")
                                    .badge(
                                        Text("P3")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: EgitimBilimleri()) {
                            HStack{
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Eğitim Bilimleri")
                                    .badge(
                                        Text("P10")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: OABTView()) {
                            HStack{
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("ÖABT")
                                    .badge(
                                        Text("P121")
                                            .italic()
                                    )
                            }
                        }
                    } header: {
                        Text("Bölüm Seçiniz")
                            .textCase(.none)
                    }
                }
            }
            .navigationTitle("KPSS Puan Hesaplama")
        }
    }
}

#Preview {
    MainView()
}
