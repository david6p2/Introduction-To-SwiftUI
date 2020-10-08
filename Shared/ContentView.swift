//
//  ContentView.swift
//  Shared
//
//  Created by David Andres Cespedes on 8/10/20.
//

import SwiftUI

struct ContentView: View {
    var sandwiches: [Sandwich] = []

    var body: some View {
        List(sandwiches) { sandwich in
            Image(sandwich.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(sandwiches: testData)
    }
}
