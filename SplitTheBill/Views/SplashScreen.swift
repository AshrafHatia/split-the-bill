//
//  SpashScreenView.swift
//  SplitTheBill
//
//  Created by Ashraf Hatia on 02/03/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opecity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        }
        else{
            VStack {
                VStack{
                    Image(systemName: "square.split.2x1.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    Spacer().frame(height:50)
                    Text("Welcome!")
                        .font(Font .custom("Zapfino", size: 28))
                        .foregroundColor(.black.opacity(0.90))
                    Text("Split The Bill!")
                        .font(Font .custom("Zapfino", size: 28))
                        .foregroundColor(.black.opacity(0.90))
                }
//                .frame(maxHeight: .infinity, alignment: .center)
                .scaleEffect(size)
                .opacity(opecity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opecity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
