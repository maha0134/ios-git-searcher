//
//  UserDetailsView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI
import Alamofire
import ToastSwiftUI

struct UserDetailsView: View {
	//MARK: Environment variables for handling orientation changes
	@Environment(\.horizontalSizeClass) var hSizeClass
	@Environment(\.verticalSizeClass) var vSizeClass
	
	//MARK: State variables
	@State var userDetails: UserDetail?
	@State var url: String
	@State var dataIsLoaded = false
	@State var alamoError = false
	@State private var toastMessage: String?
	
	var body: some View {
		
		VStack {
			if !dataIsLoaded {
				ProgressView()
				Text("data is loading...hang on!")
			} else {
				if alamoError {
					Text("Things seem to be not working as expected right now. Please try again.")
				} else {
					if let userDetails {
						
						if vSizeClass == .regular && hSizeClass == .compact {
							//portrait mode in phone
							AsyncImage(url: URL(string: userDetails.avatarUrl)) { image in
								image.resizable()
							} placeholder: {
								ProgressView()
							}
							.frame(width: 250,height: 250)
							
							DetailsView(userDetails: userDetails)
								.font(.title3)
							
							Spacer()
						} else if vSizeClass == .regular && hSizeClass == .regular {
							//tablet devices
							AsyncImage(url: URL(string: userDetails.avatarUrl)) { image in
								image.resizable()
							} placeholder: {
								ProgressView()
							}
							.frame(width: 450,height: 450)
							
							DetailsView(userDetails: userDetails)
								.font(.title2)
								.padding()
							
						} else {
							//landscape mode
							ScrollView {
								HStack(spacing:30) {
									AsyncImage(url: URL(string: userDetails.avatarUrl)) { image in
										image.resizable()
									} placeholder: {
										ProgressView()
									}
									.frame(width: 250,height: 250)
									
									DetailsView(userDetails: userDetails)
										.font(.title3)
								}
							}
						}
					}
				}
			}
		}
		.padding()
		.toast($toastMessage)
		.onAppear {
			getGithubUser()
		}
	}
}

//struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView(url)
//    }
//}

extension UserDetailsView{
	//MARK: Method
	func getGithubUser() {
		AF.request(url)
			.validate(statusCode: 200..<300)
			.responseDecodable(of: UserDetail.self) { response in
				switch response.result {
					case .failure(let err):
						
						if let msg = err.errorDescription {
							print(msg)
							toastMessage = msg
							
						} else {
							toastMessage = "something went wrong"
						}
						
					case .success(let value):
						self.userDetails = value
						self.dataIsLoaded = true
				}
			}
	}
}
