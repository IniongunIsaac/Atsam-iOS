//
//  HymnsViewController.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import UIKit
import RxSwift

class HymnsViewController: BaseViewController {
    
    @IBOutlet weak var hymnsTableView: UITableView!
    
    var hymnsViewModel: IHymnsViewModel!
    override func getViewModel() -> BaseViewModel { hymnsViewModel as! BaseViewModel }
    
    fileprivate let fontsize = currentDevice.isPad ? 18 : 14
    
    fileprivate let searchController: UISearchController = {
        UISearchController(searchResultsController: nil).apply {
            $0.dimsBackgroundDuringPresentation = false
        }
    }()
    
    override func configureViews() {
        super.configureViews()
        configureNavigationBar()
        setupHymnsTableView()
        hymnsViewModel.getHymns()
        
        if hymnsViewModel.hasUpdate {
            showDialog(for: R.storyboard.hymns.appUpdateDialogViewController()!)
        }
    }
    
    fileprivate func configureNavigationBar() {
        hideNavBar(false)
        title = "Atsam a Ikyenge"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.font = .comfortaaRegular(size: fontsize.cgfloat)
        searchController.searchBar.rx.text.orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .observe(on: MainScheduler.instance)
            .bind { [weak self] text in
                self?.hymnsViewModel.filterHymns(text: text)
            }.disposed(by: disposeBag)
    }
    
    fileprivate func setupHymnsTableView() {
        
        hymnsViewModel.hymns.map({ $0.isEmpty }).distinctUntilChanged().bind(to: hymnsTableView.rx.isEmpty(message: "Search results will be shown here!")).disposed(by: disposeBag)
        
        hymnsViewModel.hymns.bind(to: hymnsTableView.rx.items(cellIdentifier: R.reuseIdentifier.hymnTableViewCell.identifier, cellType: HymnTableViewCell.self)) { index, hymn, cell in
            
            cell.configureView(hymn: hymn)
            
            cell.animateViewOnTapGesture { [weak self] in
                self?.presentViewController(R.storyboard.hymns.hymnDetailsViewController()!.apply {
                    $0.hymn = hymn
                })
            }
            
        }.disposed(by: disposeBag)
    }

}
