//
//  JobCardView.swift
//  TeamBlue
//
//  Created by Gcode on 8/14/24.
//


import SwiftUI

struct JobCardView: View {
    var job: JobsDataManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Job Title and Pay
            HStack {
                Text(job.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                    .lineLimit(1)
                
                Spacer()
                
                Text(job.pay)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            
            // Location
            Text(job.location)
                .font(.subheadline)
                
                .lineLimit(1)
            
            // Description
            Text(job.description)
                .font(.body)
                
                .lineLimit(2) // Limit lines to keep the card compact
                .truncationMode(.tail)
            
            // Job Type
            HStack {
                Spacer()
                Text(job.jobType)
                    .font(.caption2)
                    .padding(8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        
        .cornerRadius(15)
        .shadow(radius: 6, x: 0, y: 2)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue.opacity(0.2), lineWidth: 5)
        )
        .padding(.horizontal)
    }
}


#Preview {
    let sampleJob = JobsDataManager(
        id: 1,
        name: "Software Engineer",
        location: "San Francisco, CA",
        description: "Develop and maintain software applications.",
        pay: "$120,000/year",
        jobType: "Full-Time",
        benefits: ["Health Insurance", "401k", "Paid Time Off"],
        requirements: "Experience in Swift, Xcode, and iOS development.",
        category: "Technology", image: "Hi"
       
    )
    
    return JobCardView(job: sampleJob)
}
