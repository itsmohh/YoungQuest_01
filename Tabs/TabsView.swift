import SwiftUI

struct TabsView: View {
    @Binding var selectedTab: String
    
    // Hiding Tab Bar...
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        // Tab View With Tabs...
        TabView(selection: $selectedTab){
            
            // Views...
            HomeView()
                .tag("Home")
            
            SearchView()
                .tag("Search")
            
            ExpensesView(currentTab: .constant("Expenses"))
                .tag("Budget")
            
            SettingsView()
                .tag("Settings")
            
            Text("Email YoungQuest@gmail.com for additional help")
                .tag("Help")
            
            
        }
    }
}
