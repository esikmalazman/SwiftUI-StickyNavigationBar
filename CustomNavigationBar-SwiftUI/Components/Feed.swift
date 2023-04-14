//
//  Feed.swift
//  CustomNavigationBar-SwiftUI
//
//  Created by Ikmal Azman on 13/04/2023.
//

import SwiftUI

struct Feed: View {
    
    var body: some View {
        ForEach(1...20 , id: \.self) { minutes in
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    Image(systemName: "logo.playstation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame( width:35, height: 35 )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("John Doe")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("\(60 - minutes) minutes ago")
                    }
                    
                    Spacer(minLength: 0)
                }
                
                Text("Feeling pumped after a great workout! There's nothing like the rush of endorphins and the satisfaction of pushing yourself to the limit. Whether it's hitting the gym or going for a run, staying active and prioritizing fitness is so important. What's your favorite way to stay active? #FitnessMotivation #Sports #HealthyLiving")
            }
            .padding()
            .background(.white)
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
