//
//  OrtaogretimView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    @State private var gkDogruSayisi:Double = 20
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var gyDogruSayisi:Double = 20
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var sonuc:Double = 0
    var body: some View {
        VStack {
            Form{
                Section{
                    Stepper(value: $gkDogruSayisi,in: 1...(60 - gkYanlisSayisi)){
                        Label("Doğru Sayısı \(gkDogruSayisi,specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    Stepper(value: $gkYanlisSayisi,in: 0...(60 - gkDogruSayisi)){
                        Label("Yanlış Sayısı \(gkYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                }header: {
                    Text("Genel Kültür")
                        .textCase(.none)
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
                            sonuc = 55.839 + gyNet *  0.348 + gkNet * 0.431
                        }
                        
                    }
                    .disabled(formKontrol)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
                
            }
        }
        .navigationTitle("Ortaöğretim")
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
    OrtaogretimView()
}
