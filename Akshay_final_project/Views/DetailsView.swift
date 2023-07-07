//
//  DetailsView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2023-07-07.
//

import SwiftUI

struct DetailsView: View {
	
	var userDetails: UserDetail
    var body: some View {
		VStack(spacing:15) {
			Text(userDetails.name ?? "Unknown").font(.title)
			Text(userDetails.url).foregroundColor(.blue)
			Text("Location: \(userDetails.location ?? "Unknown")")
			Text("Company: \(userDetails.company ?? "Unknown")")
			Text("Followers: \(userDetails.followers)")
			Text("Public gists: \(userDetails.publicGists)")
			Text("Public repos: \(userDetails.publicRepos)")
			Text("Updated on: " + userDetails.updatedAt.split(separator: "T")[0])
			Text("Created on: " + userDetails.createdAt.split(separator: "T")[0])
		}
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
