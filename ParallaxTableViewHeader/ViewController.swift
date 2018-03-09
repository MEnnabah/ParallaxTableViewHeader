//
//  ViewController.swift
//  ParallaxTableViewHeader
//
//  Created by Mohammed Ennabah on 09/03/2018.
//  Copyright © 2018 Mohammed Ennabah. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        // uncomment the following line to solve the flickering
//        tableView.estimatedRowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        
        let tableHeaderViewHeight:CGFloat = view.frame.height * 3 / 4
        let mapView = MKMapView(frame: CGRect(x: 0,y: 0, width: self.view.frame.width, height: tableHeaderViewHeight))
        let tableHeaderView = ParallaxTableHeaderView(size: CGSize(width: self.view.frame.width, height: tableHeaderViewHeight), subView: mapView)
        tableView.tableHeaderView = tableHeaderView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let header: ParallaxTableHeaderView = self.tableView.tableHeaderView as! ParallaxTableHeaderView
        header.layoutForContentOffset(tableView.contentOffset)
        self.tableView.tableHeaderView = header
    }
}