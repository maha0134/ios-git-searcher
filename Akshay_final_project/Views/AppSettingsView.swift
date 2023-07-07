//
//  AppSettingsView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI

struct AppSettingsView: View {
	
	//MARK: propery wrappers
	@AppStorage("resultsPerPage") var resultsPerPage: Int = 30
	@AppStorage("minimumRepos") var minimumRepos: Int = 0
	@AppStorage("minimumFollowers") var minimumFollowers: Int = 0
	
	var body: some View {
		VStack {
			Text("Tune up")
				.font(.title)
			
			Stepper(value: $resultsPerPage, in: 0...50, step: 1) {
				Text("Results per page: \(resultsPerPage)")
			}
			
			Stepper(value: $minimumRepos, in: 0...100, step: 5) {
				Text("Minimum repos: \(minimumRepos)")
			}
			
			Stepper(value: $minimumFollowers, in: 0...100, step: 5) {
				Text("Minimum followers: \(minimumFollowers)")
			}
			
			Spacer()
		}
		.padding()
	}
}

struct AppSettingsView_Previews: PreviewProvider {
	static var previews: some View {
		AppSettingsView()
	}
}
