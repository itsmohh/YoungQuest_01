//
//  WelcomeView.swift
//  TeamBlue
//
//  Created by Gcode on 8/13/24.
//

import SwiftUI

struct WelcomeView: View {
    @State var rotation: CGFloat = 0.0
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack {
            ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 260, height: 340)
                    .foregroundColor(.black)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 500, height: 200)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color(.blue).opacity(0.4), Color(.orange), Color(.blue), Color(.black).opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(rotation))
                    .mask{
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(lineWidth: 3)
                                .frame(width: 256, height: 336)
                        }
                
                        Text("Welcome To \n YoungQuest")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                Spacer().frame(height: 90)

   
                }
                    NavigationLink(destination:HomeView()) {
                        Text("Get Started")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                
    .onAppear {
        withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
            rotation = 360
        }
    }
                
                    }
               
                    
                }
            
            }
        
        }
    }
        
        #Preview {
            WelcomeView()
        }
    
