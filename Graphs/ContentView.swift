//
//  ContentView.swift
//  Graphs
//
//  Created by John Kulimushi on 13/10/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var percent1: Double = 60
    @State var percent2: Double = 70
    @State var percent3: Double = 80
    
    var gRing1:[Color] = [Color.ring1color1, Color.ring1color2]
    var gRing2:[Color] = [Color.ring2color1, Color.ring2color2]
    var gRing3:[Color] = [Color.ring3color1, Color.ring3color2]
    
    private var thickness: CGFloat = 40
    
    var body: some View {
        return NavigationView {
                VStack {
                    
                    Text("You have consumed \(String(format: "%.1f", CGFloat((self.percent1 + self.percent2 + self.percent3) / 3)))% today")
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .frame(height: 70)
                    
                    Text("Perfectly balanced \n like everything should be.")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
 
                        
                    self.createGrapth().frame(minWidth: 0.0, maxWidth: .infinity)
                    Spacer()
                    HStack {
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring1color1) )
                            Text("Carb")
                            
                        }
                        Spacer()
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring2color2) )
                            Text("Protein")
                            
                        }
                        Spacer()
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring3color2) )
                            Text("Fat")
                        }
                    }
                    
                }.padding().navigationBarTitle(Text(""), displayMode: .inline).navigationBarItems(trailing: self.trailingButton())
            
        }
    }
    
    private func createGrapth() -> some View{
        let width = UIScreen.main.bounds.width - 20
        return
            ZStack {
                Ring(percent: self.$percent1, thickness: self.thickness, fontSize: 15, gradientColors: gRing1).frame(width: width - thickness, height: width - thickness )
                Ring(percent: self.$percent2, thickness:  self.thickness, fontSize: 15, gradientColors: gRing2).frame(width: width - thickness * 3, height: width - thickness * 3)
                Ring(percent: self.$percent3, thickness:  self.thickness, fontSize: 15, gradientColors: gRing3).frame(width: width - thickness * 5, height: width - thickness * 5)
            }
    }
    
    private func trailingButton() -> some View{
          return Button(action: {
              withAnimation(.easeInOut(duration: 1)) {
                  self.percent1 = Double.random(in: 1...100)
                  self.percent2 = Double.random(in: 1...100)
                  self.percent3 = Double.random(in: 1...100)
              }
          }) {
              Image(systemName: "arrow.clockwise")
                  .resizable()
                  .frame(width: 25, height: 30)
                .foregroundColor(.ring3color2)
                  .aspectRatio(contentMode: ContentMode.fit)
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
