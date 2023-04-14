//
//  SecondaryNavigationBarButton.swift
//  CustomNavigationBar-SwiftUI
//
//  Created by Ikmal Azman on 13/04/2023.
//

import SwiftUI

struct SecondaryNavigationBarButton: View {
    @Binding var currentButtonTitle : String
    var image : String =  "shazam.logo.fill"
    @Namespace var animation : Namespace.ID
    
    var isButtonSelected : Bool {
        currentButtonTitle == image
    }
    
    var body: some View {
        Button {
            withAnimation {
                // Assigned currentButtonTitle from image when the button get tapped
                self.currentButtonTitle = image
            }
        } label: {
            VStack(spacing: 5) {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(isButtonSelected ? .blue : .black.opacity(0.3))
                // Default frame to avoid resizing
                    .frame(height: 35)
                
                // MARK:  Outline below Icon
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 5)
            
                    // MARK:  Matched Geometry Effect Slide Animation
                    if isButtonSelected {
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 5)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        }

    }
}

struct SecondaryNavigationBarButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SecondaryNavigationBarButton(currentButtonTitle: .constant(""))
            SecondaryNavigationBarButton(currentButtonTitle: .constant("shazam.logo.fill"))
        }
    }
}
