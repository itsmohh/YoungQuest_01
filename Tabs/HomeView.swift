//
//  HomeView.swift
//  TeamBlue
//
//  Created by Gcode on 8/6/24.
//
import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: String = "All"

    var categories: [String] {
        let allCategories = jobs.map { $0.category }
        let uniqueCategories = Set(allCategories)
        return ["All"] + uniqueCategories.sorted()
    }

    var filteredJobs: [JobsDataManager] {
        jobs.filter { job in
            job.applicationStatus == .notApplied && // Filter for "Not Applied" status
            (selectedCategory == "All" || job.category == selectedCategory)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Category Picker
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Job Cards
                ScrollView {
                    LazyVStack {
                        ForEach(filteredJobs) { job in
                            NavigationLink(destination: JobDetailView(job: job)) {
                                JobCardView(job: job)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Job Listings")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    HomeView()
}
