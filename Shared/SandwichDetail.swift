//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by David Andres Cespedes on 8/10/20.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    var body: some View {
        Image(sandwich.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationTitle(sandwich.name)
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichDetail(sandwich: testData[0])
        }
    }
}
