//
//  LandmarkList.swift
//  Weather
//
//  Created by fulin on 6/2/22.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredLandMarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                          (!showFavoritesOnly || landmark.isFavorite)
        }
        
    }
    
    
    var body: some View {
        /*List {
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[2])
        }*/
        NavigationView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                
                ForEach(filteredLandMarks) { landmark in
                    NavigationLink {
                    
                    //https://developer.apple.com/documentation/swiftui/navigationlink
                    LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
