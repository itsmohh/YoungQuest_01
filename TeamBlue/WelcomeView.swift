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
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(.blue).opacity(0.4), Color(.orange), Color(.blue), Color(.black).opacity(0.4)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .rotationEffect(.degrees(rotation))
                            .mask {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(lineWidth: 3)
                                    .frame(width: 256, height: 336)
                            }
                        
                        VStack {
                            Text("Welcome To \n YoungQuest")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.top, 20) // Adjust padding as needed
                                .padding(.bottom, 10) // Space between text and image

                            Spacer()
                            Spacer()
                            Spacer()

                            
                            Image("logo") // Replace with your image name
                                .resizable()
                                .padding([.top, .leading, .bottom])
                                .scaledToFit()
                                .frame(width: 290, height: 180) // Adjust size as needed
                                .foregroundColor(.white) // Adjust color if needed
                            
                            
                        }
                        .padding()
                        .frame(width: 260, height: 340, alignment: .top)
                    }
                    
                    Spacer().frame(height: 90)
                    
                    NavigationLink(destination: TabsView()) {
                        Text("Get Started")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                    }
                    
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

#Preview {
    WelcomeView()
       
}
