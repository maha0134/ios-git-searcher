//
//  AboutDetailsView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2023-07-07.
//

import SwiftUI

struct AboutDetailsView: View {
    var body: some View {
        VStack(spacing: 15) {
			Text("Git Searcher v1.0.0")
				.font(.title)
				.fontWeight(.bold)
			
			HStack {
				Text("Created by: ")
				Text("Akshay Mahajan")
					.fontWeight(.bold)
			}
			
			HStack {
				Image(systemName: "envelope")
				Text("maha0134@algonquinlive.com")
			}
			
			HStack {
				Image(systemName: "globe")
				Text("https://portfolio-akshay-mahajan.netlify.app/")
			}
			
			Spacer()
        }
    }
}

struct AboutDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDetailsView()
    }
}
