//
//  ProgressCircleView.swift
//  TeamBlue
//
//  Created by Gcode on 8/22/24.
//

import SwiftUI

struct ProgressCircleView: View {
    var status: ApplicationStatus
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                .frame(width: 50, height: 50)
            
            Circle()
                .trim(from: 0, to: status.progress)
                .stroke(status.color, lineWidth: 10)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 50, height: 50)
                .animation(.easeInOut, value: status.progress)
            
            Text(status.rawValue.prefix(1))
                .font(.headline)
                .foregroundColor(status.color)
        }
    }
}

