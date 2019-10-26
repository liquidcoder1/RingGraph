//
//  SwiftUIView.swift
//  Graphs
//
//  Created by John K on 23/10/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct NutrientModifier: ViewModifier {
    var color: Color = .red
    func body(content: Content) -> some View {
           content.foregroundColor(color)
           .frame(width: 25, height: 25)
           .cornerRadius(4)
    }

}

