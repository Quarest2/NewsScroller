//
//  NewsViewController.swift
//  News
//
//  Created by Аскар Ахметьянов on 12.12.2024.
//

import UIKit

class NewsViewController: UIViewController {
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    let articleManager = ArticleManager()
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        self.view = ArticlesView()
    }
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = Constants.newsViewControllerBackgroundColor
        self.navigationItem.title = Constants.newsViewControllerTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(ArticlesView.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }

    
}

