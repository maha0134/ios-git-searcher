//
//  AboutView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI

struct AboutView: View {
	
	//MARK: Environment variables for handling orientation changes
	@Environment(\.horizontalSizeClass) var hSizeClass
	@Environment(\.verticalSizeClass) var vSizeClass
	
	var body: some View {
		if vSizeClass == .regular && hSizeClass == .compact ||
			vSizeClass == .regular && hSizeClass == .regular {
			//portrait mode in phone/tablet
			VStack(spacing: 15) {
				
				AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/90360626?v=4"))
				
				AboutDetailsView()
			}
			.font(.title3)
			.padding()
			
		} else {
			//landscape view
			HStack {
				AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/90360626?v=4"))
				
				AboutDetailsView()
					.font(.title3)
					.padding()
			}
			.padding()
		}
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		AboutView()
	}
}
