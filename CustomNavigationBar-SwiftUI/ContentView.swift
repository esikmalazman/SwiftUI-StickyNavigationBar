//
//  ContentView.swift
//  CustomNavigationBar-SwiftUI
//
//  Created by Ikmal Azman on 13/04/2023.
//  Resizable Custom NavBar in SwiftUI
//  https://www.youtube.com/watch?v=h7dWHr5gTzc

import SwiftUI

struct ContentView: View {
    @State var currentButtonTitle = "house.fill"
    @Namespace var animation
    @State var isHide = false
    
    var body: some View {
        // Reading screen safe area insets value
        GeometryReader { geometry in
            VStack(spacing : 0) {
                
                navigationBarView
                    .background(.white)
                    .padding(.top, geometry.safeAreaInsets.top)
                
                postContentView
            }
            .background(.black.opacity(0.05))
            .ignoresSafeArea()
        }
    }
    
    // MARK: Navigation Bar
    var navigationBarView : some View {
        VStack(spacing: 20) {
            // Hide Main Top Bar when content get scrolling down
            if !isHide {
                mainNavigationBarView
            }
            secondaryNavigationBarView
        }
    }
    
    // MARK:  Main Top Bar
    var mainNavigationBarView : some View {
        HStack {
            Text("Facebook")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.blue)
            
            Spacer(minLength: 0)
            
            Button {} label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Circle())
            }
            
            Button {} label: {
                Image(systemName: "message.fill")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.black.opacity(0.1))
                    .clipShape(Circle())
            }
            
        }
        .padding(.horizontal)
    }
    
    // MARK:  Secondary Top Bar
    // Display and replace the main top bar when content get scroll down
    var secondaryNavigationBarView : some View {
        HStack(spacing: 0) {
            SecondaryNavigationBarButton(currentButtonTitle: $currentButtonTitle, image: "house.fill", animation: _animation)
            SecondaryNavigationBarButton(currentButtonTitle: $currentButtonTitle, image: "magnifyingglass", animation: _animation)
            SecondaryNavigationBarButton(currentButtonTitle: $currentButtonTitle, image: "person.2.fill", animation: _animation)
            SecondaryNavigationBarButton(currentButtonTitle: $currentButtonTitle, image: "tv.fill", animation: _animation)
        }
    }
    
    // MARK:  Content
    var postContentView : some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // Reading location values
                GeometryReader { reader -> AnyView in
                    let yAxis = reader.frame(in: .global).midY
                    print("min yAxis : \(yAxis)")
                    
                    // Display Main NavBar if above 0 otherwise hide it
                    if yAxis < 0 && !isHide {
                        DispatchQueue.main.async {
                            self.isHide = true
                        }
                    }
                    
                    if yAxis > 0 && isHide {
                        DispatchQueue.main.async {
                            self.isHide = false
                        }
                    }
                    
                    return AnyView(
                        Text("")
                            .frame(width: 0, height : 0)
                    )
                }
                Feed()
                    .padding(.vertical, 10)
            }
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
