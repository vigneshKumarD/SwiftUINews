//
//  CustomUserinterface.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 21/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI
  
 struct GradientBackgroundStyle: ButtonStyle {
  
     func makeBody(configuration: Self.Configuration) -> some View {
         configuration.label
             .frame(minWidth: 0, maxWidth: .infinity)
             .padding()
             .foregroundColor(.white)
             .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
             .cornerRadius(40)
             .padding(.horizontal, 20)
     }
 }
