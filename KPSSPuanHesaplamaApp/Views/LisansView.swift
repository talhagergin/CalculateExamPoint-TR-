//
//  OrtaogretimView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct LisansView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var gkDogruSayisi:Double = 20
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var gyDogruSayisi:Double = 20
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
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
                    Text("2023 KPSS Puanı: \(sonuc2023,specifier: "%.3f")")
                        .bold()
                    Text("2022 KPSS Puanı: \(sonuc2022,specifier: "%.3f")")
                        .bold()
                    HesaplaButton(title: "Hesapla"){
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        withAnimation {
                                        sonuc2023 = Constants.lisans2023Puan + gyNet * Constants.lisans2023GYKatsayi + gkNet * Constants.lisans2023GKKatsayi
                                        sonuc2022 = Constants.lisans2022Puan + gyNet * Constants.lisans2022GYKatsayi + gkNet * Constants.lisans2022GKKatsayi
                                    }
                        // SwiftData
                        let result2022 = Result(sinavAdi: "2022 Lisans KPSS", gyNet: gyNet, gkNet: gkNet, sonuc: sonuc2022)
                        let result2023 = Result(sinavAdi: "2023 Lisans KPSS", gyNet: gyNet, gkNet: gkNet, sonuc: sonuc2023)
                        modelContext.insert(result2022)
                        modelContext.insert(result2023)
                        
                    }
                    .disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .bold()
                        .foregroundStyle(.main)
                }
                
            }
        }
        .navigationTitle("Lisans (B Grubu)")
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
    LisansView()
}
