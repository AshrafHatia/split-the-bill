//
//  ContentView.swift
//  SplitTheBill
//
//  Created by Ashraf Hatia on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    @State var navTitle:String = "Split the Bill"
    @State var model:SideMenuOptionModel?
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab){
                    ForEach(SideMenuOptionModel.allCases) { option in
                        option.viewPage
                    }
                }
                .onChange(of: selectedTab) { newValue in
                    NavSelect(selectedTab)
                }
                
                SideMenuView(isShowing: $showMenu,selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading)
                {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
        }
        
    }
    
    private func NavSelect(_ option:Int = 0){
        model = SideMenuOptionModel(rawValue: option)
        print(model?.title ?? navTitle)
        navTitle =  model?.pageTitle ?? navTitle
    }
}

#Preview {
    ContentView()
}
