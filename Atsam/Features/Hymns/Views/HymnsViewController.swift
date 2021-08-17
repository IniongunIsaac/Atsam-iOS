//
//  HymnsViewController.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import UIKit

class HymnsViewController: BaseViewController {
    
    @IBOutlet weak var hymnsTableView: UITableView!
    
    var hymnsViewModel: IHymnsViewModel!
    override func getViewModel() -> BaseViewModel { hymnsViewModel as! BaseViewModel }

    override func configureViews() {
        super.configureViews()
        title = "Atsam a Ikyenge"
        setupHymnsTableView()
        hymnsViewModel.getHymns()
    }
    
    fileprivate func setupHymnsTableView() {
        
        hymnsViewModel.hymns.map({ $0.isEmpty }).distinctUntilChanged().bind(to: hymnsTableView.rx.isEmpty(message: "Search results will be shown here!")).disposed(by: disposeBag)
        
        hymnsViewModel.hymns.bind(to: hymnsTableView.rx.items(cellIdentifier: R.reuseIdentifier.hymnTableViewCell.identifier, cellType: HymnTableViewCell.self)) { index, hymn, cell in
            
            cell.configureView(hymn: hymn)
            
            cell.animateViewOnTapGesture { [weak self] in
                //self?.searchViewModel.handleVerseSelected(verse)
            }
            
        }.disposed(by: disposeBag)
    }

}
