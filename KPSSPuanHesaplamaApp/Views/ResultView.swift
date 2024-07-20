//
//  ResultView.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 15.07.2024.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(0 ..< 20) { item in
                        Text("Hesaplama")
                }
            }
            .navigationTitle("Geçmiş Hesaplamalar")
        }
    }
}

#Preview {
    ResultView()
}
