//
//  ViewController.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class EntriesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let networkManagerData = NetworkManagerData()
    private var sessionKey = ""
    private var entries = [EntryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        
        newSession()

        
    }
    @IBAction func refresh(_ sender: Any) {
        newSession()
    }
    
     @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
       getEntries()
    }
}

//MARK: TableViewDelegate TableiewDataSource
extension EntriesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailedEntry", for: indexPath) as! EntriesTVCell
        let entry = entries[indexPath.row]
        cell.configure(with: entry)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
}

// MARK: - Navigation
extension EntriesVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedEntry" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let entry = entries[indexPath.row]
            let detailedEntryVC = segue.destination as! DetailedEntryVC
            detailedEntryVC.sesionKey = sessionKey
            detailedEntryVC.entry = entry
        } else if  segue.identifier == "addEntry" {
            let addEntryVC = segue.destination as! AddEntryVC
            addEntryVC.sesionKey = sessionKey
        }
    }
}

//MARK: Network
extension EntriesVC {
    private func newSession() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        networkManagerData.newSession() { [weak self] (sessionKey, error)  in
            guard let sessionKey = sessionKey else {
                print(error ?? "")
                DispatchQueue.main.async {
                    self?.alertNetwork(message: error ?? "")
                }
                return
            }
            
            switch sessionKey.status {
            case 0:
                DispatchQueue.main.async {
                    self?.alertNetwork(message: sessionKey.error ?? "")
                }
            case 1:
                self?.sessionKey = sessionKey.data?.session ?? ""
                self?.getEntries()
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                }
            default:
                return
            }
        }
    }
    private func getEntries() {
        networkManagerData.getEntries(session: sessionKey) { [weak self] (entries, error)  in
            guard let entries = entries else {
                print(error ?? "")
                DispatchQueue.main.async {
                    self?.alertNetwork(message: error ?? "")
                }
                return
            }
            
            switch entries.status {
            case 0:
                DispatchQueue.main.async {
                    self?.alertNetwork(message: entries.error ?? "")
                }
            case 1:
                print(entries)
                DispatchQueue.main.async {
                    self?.entries = entries.data![0]
                    self?.tableView.reloadData()
                }
            default:
                return
            }
        }
    }
}

//MARK: Alert
extension EntriesVC {
    func alertNetwork(message: String) {
        UIAlertController.alert(title:"Error", msg:"\(message)", target: self)
    }
}
