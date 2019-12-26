//
//  UsersTableViewController.swift
//  TestingNewAPI
//
//  Created by Vlastimir on 7/6/19.
//  Copyright © 2019 Vlastimir. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    private let alertService = AlertService()
    
    private var users = [User]()
    
    private var dataSource: UITableViewDiffableDataSource<Section, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }

    @IBAction private func didTapAddButton() {
        let alert = alertService.createUserAlert(completion: { [weak self] name in
            self?.addNewUser(with: name)
        })
        present(alert, animated: true)
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, User>(tableView: tableView) { (tableView, indexPath, user) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = user.name
            return cell
        }
    }
    
    private func addNewUser(with name: String) {
        let user = User(name: name)
        users.append(user)
        createSnapshot(from: users)
    }
    
    func createSnapshot(from users: [User]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(users)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        print(user)
    }
}

extension UsersTableViewController {
    fileprivate enum Section {
        case main
    }
}
