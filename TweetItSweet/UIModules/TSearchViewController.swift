//
//  TSearchViewController.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 16/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import UIKit

class TSearchViewController: UIViewController {
    
    @IBOutlet weak private var aSearchButton: UIButton!
    @IBOutlet weak var aSegmentView: UISegmentedControl!
    @IBOutlet weak private var aSearchTextField: UITextField!
    @IBOutlet weak private var aSearchResultTableView: UITableView!
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    private var tweetSearchViewModel: TweetSearchViewModel!
    private var resultType: ResultType = .recent {
        didSet {
            callSearchTweets()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        tweetSearchViewModel = TweetSearchViewModel()
        tweetSearchViewModel.searchResultDataReceivedClousure = { [weak self] in
            if let strongSelf = self {
                strongSelf.activityView.stopAnimating()
                strongSelf.refreshUI()
            }
        }
    }
    
    // MARK: Setup UI on first call.
    fileprivate func setupUI() {
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        aSearchTextField.setCornerRadiusTextField(value: 15)
        aSearchTextField.setBorderTextField(color: .lightGray, size: 1.0)
        activityView.color = kAppThemeColor
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        
    }
    
    // MARK: Register Cell.
    fileprivate func registerCell() {
        aSearchResultTableView.register(UINib(nibName: kSearchResultCellIdentifiers, bundle: nil), forCellReuseIdentifier: kSearchResultCellIdentifiers)
    }
    
    // MARK: Refresh UI.
    fileprivate func refreshUI() {
        //        aSearchResultTableView.isHidden = false
        DispatchQueue.main.async {
            self.aSearchResultTableView.reloadData()
        }
    }
    
    // MARK: Call Search tweets Api.
    fileprivate func callSearchTweets () {
        if let searchText = aSearchTextField.text, !searchText.isEmpty {
            activityView.startAnimating()
            tweetSearchViewModel.searchTweets(queryText: searchText, result_type: self.resultType, count: 15)
        } else {
            Loader.showAlert(message: "Please enter text")
        }
    }
    
    // MARK: Twitter Button Action
    @IBAction func twitterSearchButtonAction(_ sender: UIButton) {
        callSearchTweets()
    }
    
    // MARK: Filter Button Action
    @IBAction func segmentFilterAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            resultType = .recent
        case 1:
            resultType = .popular
        default:
            resultType = .mixed
        }
    }
}

// MARK: Table View Delegate & Datasource Methods.
extension TSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetSearchViewModel.numberOfItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSearchResultCellIdentifiers, for: indexPath) as! TSearchTweetTableViewCell
        let data = tweetSearchViewModel.getTweetsData(atIndex: indexPath.row)
        if let model = data {
            cell.configCell(model: model)
        }
        return cell
    }
}

// MARK: TextField Delegate Method
extension TSearchViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBorderTextField(color: kAppThemeColor, size: 1.0)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setBorderTextField(color: .lightGray, size: 1.0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        aSearchTextField.resignFirstResponder()
        callSearchTweets()
        return true
    }
}
