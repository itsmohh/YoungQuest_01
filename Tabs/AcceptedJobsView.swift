//
//  AcceptedJobsView.swift
//  TeamBlue
//
//  Created by Sixty One on 8/21/24.
//

import SwiftUI

struct AcceptedJobsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding(.top, 20)

            Text("You've accepted a new job!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Position:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("Software Engineer")
                        .font(.title3)
                        .fontWeight(.medium)
                }

                HStack {
                    Text("Company:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("Tech Corp")
                        .font(.title3)
                        .fontWeight(.medium)
                }

                HStack {
                    Text("Location:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("San Francisco, CA")
                        .font(.title3)
                        .fontWeight(.medium)
                }

                HStack {
                    Text("Salary:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("$120,000/year")
                        .font(.title3)
                        .fontWeight(.medium)
                }

                HStack {
                    Text("Date Accepted:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("August 19, 2024")
                        .font(.title3)
                        .fontWeight(.medium)
                }
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AcceptedJobsView()
}
