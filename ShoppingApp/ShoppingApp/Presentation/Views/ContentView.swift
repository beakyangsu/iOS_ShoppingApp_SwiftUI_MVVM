//
//  ContentView.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/07.
//

import SwiftUI
import CoreData

//asset에서 accent color를 바꾸면 네비바 색이 바뀜

struct ContentView: View {
    @StateObject private var cartManager = CartManager()

    //navigate app to home tab when app started
    @State private var currentTab : Tab = .Home

    init() {
        //UITabBar hidden when first time
        UITabBar.appearance().isHidden = true
    }

    @Namespace var animation

    var body: some View {
        VStack(spacing:0) {
            TabView(selection: $currentTab) {
                //currentTab == tag 일경우 보이는것
                HomePageView()
                    .tag(Tab.Home)
                Text("Search View")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Search)
                Text("Notifications View")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Notifications)
                Text("Cart View")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Cart)
                Text("Profile View")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background()
                    .tag(Tab.Profile)

            }
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : getSafeArea().bottom - 15)
                .background(Color.solSecondary)
            }
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}
#Preview {
    ContentView().environmentObject(CartManager())
}

extension ContentView {
    func TabButton(tab: Tab) -> some View {
        GeometryReader{ proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }, label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundStyle(Color.solRrimary)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25) // image frame
                        .frame(maxWidth: .infinity) //parent frame
                        .background(
                            ZStack {
                                //click effect
                                if currentTab == tab {
                                    //effect view
                                    MaterialEffect(style: .light) .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    Text(tab.tabName)
                                        .foregroundStyle(.primary)
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                    //클릭시 위로 살짝 뜨게하는 효과
                }
            })
        }
        .frame(height: 25)
        //이거 안하면 TabButton이 부모의 영역까지 차지할수있는만큼 다차지함
    }
}
