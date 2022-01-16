//
//  LandmarkList.swift
//  MacLandmarks
//
//  Created by Mostafa Rahmani on 1400/26/10 AP.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject private var userData: UserData
    @Binding var selectedLandmark: Landmark?
    
    var body: some View {
        List(selection: $selectedLandmark) {
            ForEach(userData.landmarks)  {
                landmark in
                if  (!self.userData.showFavoritesOnly || landmark.isFavorite) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList(selectedLandmark: .constant((landmarkData[0])))
            .environmentObject(UserData())
    }
}
