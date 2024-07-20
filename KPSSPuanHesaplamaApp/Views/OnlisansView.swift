//
//  OrtaogretimView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct OnlisansView: View {
    @State private var gkDogruSayisi:Double = 20
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var gyDogruSayisi:Double = 20
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var sonuc:Double = 0
    var body: some View {
        VStack {
            Form{
                Section{
                    Stepper("Doğru Sayısı \(gkDogruSayisi,specifier: "%.0f")", value: $gkDogruSayisi,in: 1...(60 - gkYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    Stepper("Yanlış Sayısı \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi,in: 0...(60 - gkDogruSayisi))
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                }header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                        .bold()
                        .foregroundStyle(.main)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez!")
                            .foregroundStyle(.red)
                    }
                }
                
                Section{
                    Stepper("Doğru Sayısı \(gyDogruSayisi, specifier: "%.0f")", value: $gyDogruSayisi,in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    Stepper("Yanlış Sayısı \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi,in: 0...60)
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                }header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                        .bold()
                        .foregroundStyle(.main)
                } footer: {
                    if(gyDogruSayisi + gyDogruSayisi > 60){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez!")
                            .foregroundStyle(.red)
                    }
                }
                Section{
                    Text("2022 KPSS Puanı: \(sonuc,specifier: "%.3f")")
                        .bold()
                    HesaplaButton(title: "Hesapla"){
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        withAnimation{
                            sonuc = (53.816 + gyNet * 0.43 + gkNet * 0.397)
                        }
                        
                    }
                    .disabled(formKontrol)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .bold()
                        .foregroundStyle(.main)
                }
                
            }
        }
        .navigationTitle("Önlisans")
        .toolbar(.hidden, for: .tabBar)
    }
    var formKontrol: Bool{
        if((gkDogruSayisi + gkYanlisSayisi) > 60 || (gyDogruSayisi + gyYanlisSayisi) > 60){
           return true
        }
        return false
    }
}

#Preview {
    OnlisansView()
}
