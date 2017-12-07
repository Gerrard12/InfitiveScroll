//
//  ViewController.swift
//  InfiniteScroll
//
//  Created by gerardo on 7/12/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var labels = ["1","2","3","4","5","6","7","8","9","10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        table.addInfiniteScroll { (result) in
            // todo tu código
            self.labels = self.labels + self.labels
            self.table.reloadData()
            //finalizar el scroll infinito
            self.table.finishInfiniteScroll()
        }
        //Carga 500 ptos antes de llegar al final del scroll.
        table.infiniteScrollTriggerOffset = 500;
    }
}

extension ViewController:UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController:UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = labels[indexPath.row]
        return cell
    }
}

