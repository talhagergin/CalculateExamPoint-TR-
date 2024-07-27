//
//  CalculateViewModel.swift
//  KPSSPuanHesaplamaApp
//
//  Created by Talha Gergin on 22.07.2024.
//

import Foundation
import Observation
import SwiftUI

@Observable
class CalculateViewModel{
   @ObservationIgnored @AppStorage("calculateCount") var calculateCount = 1 //cihazda veri tutmak için
}
