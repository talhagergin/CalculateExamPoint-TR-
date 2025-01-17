//
//  OrtaogretimView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct EgitimBilimleri: View {
    @Environment(\.modelContext) private var  modelContext
    @State private var gkDogruSayisi:Double = 20
    @State private var gkYanlisSayisi:Double = 0
    
    @State private var gyDogruSayisi:Double = 20
    @State private var gyYanlisSayisi:Double = 0
    
    @State private var ebDogruSayisi:Double = 20
    @State private var ebYanlisSayisi:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonucEB2022:Double = 0
    @State private var sonuc2023:Double = 0
    @State private var sonucEB2023:Double = 0
    
    @State private var isShowingSheet = false
    var body: some View {
        VStack {
            Form{
                Section{
                    Stepper("Doğru Sayısı \(gkDogruSayisi,specifier: "%.0f")", value: $gkDogruSayisi,in: 1...(60 - gkYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi,in: 0...(60 - gkDogruSayisi))
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                        .bold()
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
                        .bold()
                    Stepper("Yanlış Sayısı \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi,in: 0...60)
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                        .bold()
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
                    Stepper("Doğru Sayısı \(ebDogruSayisi,specifier: "%.0f")", value: $ebDogruSayisi,in: 1...(80 - ebYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı \(ebYanlisSayisi, specifier: "%.0f")", value: $ebYanlisSayisi,in: 0...(80 - ebDogruSayisi))
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                        .bold()
                    HesaplaButton(title: "Hesapla"){
                        
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        
                        sonucEB2022   = Constants.eb2022Puan + gyNet * Constants.eb2022GYKatsayi + gkNet * Constants.eb2022GKKatsayi + ebNet * Constants.eb2022Katsayi
                        sonuc2022     = Constants.lisans2022Puan + gyNet * Constants.lisans2022GYKatsayi + gkNet * Constants.lisans2022GKKatsayi
                        sonucEB2023   = Constants.eb2023Puan + gyNet * Constants.eb2023GYKatsayi + gkNet * Constants.eb2023GKKatsayi + ebNet * Constants.eb2023Katsayi
                        sonuc2023     = Constants.lisans2023Puan + gyNet * Constants.lisans2023GYKatsayi + gkNet * Constants.lisans2023GKKatsayi
                        
                        isShowingSheet.toggle()
                        
                        // SwiftData
                        let result2022EB = Result(sinavAdi: "2022 Eğitim Bilimleri", gyNet: gyNet, gkNet: gkNet, ebNet: ebNet, sonuc: sonucEB2022)
                        let result2023EB = Result(sinavAdi: "2023 Eğitim Bilimleri", gyNet: gyNet, gkNet: gkNet, ebNet: ebNet, sonuc: sonucEB2023)
                        
                        modelContext.insert(result2022EB)
                        modelContext.insert(result2023EB)
                        
                    }
                    .disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet, content: {
                        SonucView(sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: nil, sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil)
                    })
                }header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                        .bold()
                        .foregroundColor(.main)
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez!")
                            .foregroundStyle(.red)
                    }
                }   
            }
        }
        .navigationTitle("Eğitim Bilimleri")
        .toolbar(.hidden, for: .tabBar)
    }
    var formKontrol: Bool{
        if((ebDogruSayisi + ebYanlisSayisi) > 80 || (gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60 ){
           return true
        }
        return false
    }
}

#Preview {
    EgitimBilimleri()
}
