//
//  AcceptedJobsView.swift
//  TeamBlue
//
//  Created by Sixty One on 8/21/24.
//

import SwiftUI

class OtherStatusesJobsViewModel: ObservableObject {
    @Published var otherStatusJobs: [JobsDataManager] = []
    
    init() {
        filterJobs()
    }
    
    private func filterJobs() {
        otherStatusJobs = jobs.filter { job in
            job.applicationStatus != .notApplied // Filter out "Not Applied" jobs
        }
    }
}


struct JobStatusView: View {
    @StateObject private var viewModel = OtherStatusesJobsViewModel()
    @State private var selectedCategory: String = "All"
    
    var categories: [String] {
        let allCategories = viewModel.otherStatusJobs.map { $0.category }
        let uniqueCategories = Set(allCategories)
        return ["All"] + uniqueCategories.sorted()
    }

    var filteredJobs: [JobsDataManager] {
        viewModel.otherStatusJobs.filter { job in
            (selectedCategory == "All" || job.category == selectedCategory)
        }
    }

    var body: some View {
        NavigationView {
            VStack {

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
            .navigationTitle("Jobs Status")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    JobStatusView()
        
}

