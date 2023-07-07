//
//  UserSearchResultsView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI

struct UserSearchResultsView: View {
    //MARK: properties
    let userList: [User]
    
    var body: some View {
		
        NavigationStack {
			
            List(userList) { user in
                NavigationLink(destination: UserDetailsView(url: user.url)) {
					
                    ListItemView(user: user)
                }
            }
        }
    }
}

struct UserSearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
		UserSearchResultsView(userList:
								[.init(id: 1, username: "maha0134", type: "User", avatarURL: "", followersURL: "", reposURL: "", url: ""),
								.init(id: 1, username: "maha0134", type: "User", avatarURL: "", followersURL: "", reposURL: "", url: "")
								])
    }
}
