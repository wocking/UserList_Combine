//
//  AccountListVC.swift
//  BoshMVC
//
//  Created by Heng.Wang on 2022/1/13.
//  Copyright © 2022 Heng.Wang. All rights reserved.
//

import UIKit
import Combine

class AccountListVC: UIViewController {

    @IBOutlet weak var listTable: UITableView!
    
    fileprivate let viewModel = AccountListViewModel()
    fileprivate(set) var cancellable: Set<AnyCancellable> = []
    
    var last = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.callGetUserListAPI()
        viewModelBindToView()
    } 
}


//MARK:- Bind view
extension AccountListVC {
    fileprivate func viewModelBindToView() {
        viewModel.$userData
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.listTable.reloadData()
            }.store(in: &cancellable)
    } 
}


//MARK:- Table view delegate & data source
extension AccountListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let picture = viewModel.userData[indexPath.row].picture?.medium ?? ""
        cell.imageView?.setImageWithUrlPath(picture)
        last = indexPath.last == indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= viewModel.userData.count - 1 && last == true{
            viewModel.callGetUserListAPI()
        }
    }
}
