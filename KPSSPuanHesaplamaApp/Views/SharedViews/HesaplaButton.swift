//
//  HesaplaButton.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 20.07.2024.
//

import SwiftUI

struct HesaplaButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        },label:{
            Label(title, systemImage: "plus.forwardslash.minus")
                .font(.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .tint(.main) // renk verdik butona
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("hesapla")
    })
}
