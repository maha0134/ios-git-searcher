//
//  ListItemView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI

struct ListItemView: View {
	
    //MARK: properties
    let user: User
	
    var body: some View {
        
        HStack{
                AsyncImage(url: URL(string: user.avatarURL)) { image in
					
                    image.resizable()
					
                } placeholder: {
                    
					ProgressView()
                }
                .frame(width: 75, height: 75)
				.cornerRadius(100)
			
                VStack(alignment: .leading) {
                    
					Text(user.username)
					
                    Text(user.type)
                }
            Spacer()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
		ListItemView(user: .init(id: 1, username: "maha0134", type: "User", avatarURL: "", followersURL: "", reposURL: "", url: ""))
    }
}
