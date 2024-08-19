//
//  TabsView.swift
//  TeamBlue
//
//  Created by Gcode on 8/13/24.
//

import SwiftUI

struct TabsView: View {
    @State private var tabSelection = 1
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tag(1)
            
            SearchView()
                .tag(2)
            
            ExpensesView(currentTab: .constant("Expenses"))
                .tag(3)
            
            SettingsView()
                .tag(4)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabsView()
}
