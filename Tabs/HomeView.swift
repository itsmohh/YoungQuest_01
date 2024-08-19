//
//  HomeView.swift
//  TeamBlue
//
//  Created by Gcode on 8/6/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: String = "All"
    @State private var searchQuery: String = ""
    
    var categories: [String] {
        let allCategories = jobs.map { $0.category }
        let uniqueCategories = Set(allCategories)
        return ["All"] + uniqueCategories.sorted()
    }
    
    var filteredJobs: [JobsDataManager] {
        jobs.filter { job in
            (selectedCategory == "All" || job.category == selectedCategory) &&
            (searchQuery.isEmpty || job.name.lowercased().contains(searchQuery.lowercased()))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Logo
                GeometryReader { geometry in
                    HStack {
                        Text("Job Listings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            
                        Spacer()
                        Image("logo") // Replace with your logo image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width * 0.5, 200), height: 100)
                            .padding(.top, 16) // Optional padding from the top
                        
                    }
                }
                .frame(height: 100) // Set a fixed height to the GeometryReader to ensure the logo has a space
               
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
//            .navigationTitle("Job Listings")
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
