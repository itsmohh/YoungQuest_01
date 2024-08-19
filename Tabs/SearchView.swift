import SwiftUI

struct SearchView: View {
    @State private var searchQuery: String = ""
    @State private var jobs: [JobsDataManager] = load("Jobs.json") // Load jobs from JSON

    var filteredJobs: [JobsDataManager] {
        if searchQuery.isEmpty {
            return [] // Return an empty array when the search query is empty
        } else {
            return jobs.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(text: $searchQuery)
                    .padding(.horizontal)
                    .padding(.top, 8)

                if filteredJobs.isEmpty {
                    Spacer() // Pushes the message to the center if no jobs are found
                    Text(searchQuery.isEmpty ? "     Start typing to search for jobs." : "                     No jobs found.")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Spacer() // Pushes the message to the center if no jobs are found
                } else {
                    List(filteredJobs) { job in
                        NavigationLink(destination: JobDetailView(job: job)) {
                            HStack {
                                Image(systemName: "briefcase.fill")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                    .padding(.trailing, 8)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(job.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)

                                    Text(job.location)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Job Search")
        }
    }
}

#Preview {
    SearchView()
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Jobs"
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = UIColor.systemBlue
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
