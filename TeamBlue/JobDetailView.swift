//
//  JobDetailView.swift
//  TeamBlue
//
//  Created by Gcode on 8/14/24.
//

import SwiftUI

struct JobDetailView: View {
    var job: JobsDataManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(job.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 8)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.blue)
                    Text(job.location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                Text("Description")
                    .font(.headline)
                    .padding(.bottom, 4)
                Text(job.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
                
                Divider()
                
                HStack {
                    Image(systemName: "dollarsign.circle")
                        .foregroundColor(.green)
                    Text("Pay: \(job.pay)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                HStack {
                    Image(systemName: "briefcase")
                        .foregroundColor(.orange)
                    Text("Job Type: \(job.jobType)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                if let benefits = job.benefits, !benefits.isEmpty {
                    Text("Benefits")
                        .font(.headline)
                        .padding(.bottom, 4)
                    ForEach(benefits, id: \.self) { benefit in
                        HStack {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.green)
                            Text(benefit)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.bottom, 8)
                }
                
                Divider()
                
                Text("Requirements")
                    .font(.headline)
                    .padding(.bottom, 4)
                Text(job.requirements)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Divider()
                
                HStack {
                    Image(systemName: "tag")
                        .foregroundColor(.purple)
                    Text("Category: \(job.category)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                HStack {
                    ProgressCircleView(status: job.applicationStatus)
                    
                    Text("Application Status: \(job.applicationStatus.rawValue)")
                        .font(.headline)
                        .foregroundColor(job.applicationStatus.color)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Job Details")
            .background(Color(UIColor.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding()
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
        category: "Technology",
        image: "software_engineer",
        applicationStatus: .notApplied // Example status
    )
    
    return JobDetailView(job: sampleJob)
}

