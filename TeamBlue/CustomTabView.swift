//
//  CustomTabView.swift
//  TeamBlue
//
//  Created by Gcode on 8/13/24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    let tabBarItems: [(image: String, title: String)] = [
        ("home", "Home"),
        ("search", "Search"),
        ("budget", "Budget"),
        ("settings", "Settings")
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 390, height: 80)
                .foregroundColor(.blue)
                .shadow(radius: 2)
            HStack {
                ForEach(0..<4) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            
                            Image(tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                                .font(.caption)
                            
                                .foregroundColor(index + 1 == tabSelection ? .white : .black)
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 10)
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y: 3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                               
                        }
                        .frame(height: 80)
                        .clipShape(Capsule())
                    }
                }
            }
        }
    }
}
                    #Preview {
                        CustomTabView(tabSelection: .constant(1))
                            .previewLayout(.sizeThatFits)
                            .padding(.vertical)
                    }
