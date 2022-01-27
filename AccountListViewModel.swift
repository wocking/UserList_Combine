//
//  AccountListViewModel.swift
//  BoshMVC
//
//  Created by Heng.Wang on 2022/1/13.
//  Copyright © 2022 Heng.Wang. All rights reserved.
//

import Foundation
import Combine
import PromiseKit

final class AccountListViewModel {
    
    @Published var userData: [UserProfile] = [] 
    
    private(set) var page: Int = 0
    
    func callGetUserListAPI() {
        firstly {
            APIService<UserListModel>().request(RandomUserService.getUserList(page))
        }.done { response in
            self.page += 1
            self.userData.append(contentsOf: response.results ?? [])
        }.ensure {
            
        }.catch {
            print("random user api error message:\n\($0)\n\n---random user api end")
        }
    } 
}
