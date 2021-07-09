//
//  ViewController.swift
//  Good News
//
//  Created by Jaouher Bejaoui  on 9/7/2021.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
   
    
    let disposeBag = DisposeBag()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCell doesn't exist")
        }
        
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].description
    
        return cell
    }
    
    private func populateNews(){
        URLRequest.load(resource: ArticlesList.all)
            .subscribe(onNext : { [weak self] result in
                if let result = result {
                    self?.articles = result.articles
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }


}

