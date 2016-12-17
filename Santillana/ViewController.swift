//
//  ViewController.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 12/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabeView: UITableView!
    @IBOutlet weak var menuSecundario: UIView!
    @IBOutlet weak var viewDisplayer: UIView!
    @IBOutlet weak var imvFondo: UIImageView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblSubtitulos: UILabel!

    var currentMenu = [MenuManager]()
    var currentViewDisplayed: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func abrirMenu(sender: UIButton){
        switch sender.tag {
        case 0:
            self.currentMenu = MenuManager.getMenuSolicitudEducativa()
            self.lblTitulo.text = "Solución Educativa Integral"
        default:
            break
        }
        self.eliminarVistaActual()
        self.menuSecundario.isHidden = false
        self.header.isHidden = true
        self.lblSubtitulos.text = ""
        self.imvFondo.image = #imageLiteral(resourceName: "fondo")
        self.tabeView.reloadData()
    }
    
    func eliminarVistaActual(){
        if let currentView = self.currentViewDisplayed{
            currentView.willMove(toParentViewController: nil)
            currentView.view.removeFromSuperview()
            currentView.removeFromParentViewController()
            self.currentViewDisplayed = nil
            self.viewDisplayer.isHidden = true
        }
    }

}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.142
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = self.currentMenu[indexPath.row]
        
        if self.lblSubtitulos.text!.isEmpty{
            self.lblSubtitulos.text = menu.titulo
        }else{
            self.lblSubtitulos.text! += "<\(menu.titulo)"
        }
        
        if menu.storyboardIdentifier != nil{
            guard let content = self.storyboard?.instantiateViewController(withIdentifier: menu.storyboardIdentifier!) else{
                return
            }
            self.addChildViewController(content)
            content.view.frame = self.viewDisplayer.frame
            self.view.addSubview(content.view)
            content.didMove(toParentViewController: self)
            self.menuSecundario.isHidden = true
            self.viewDisplayer.isHidden = false
            self.header.isHidden = false
            self.imvFondo.image = #imageLiteral(resourceName: "espacio")
            self.currentViewDisplayed = content

        }else if menu.subviews != nil{
            self.currentMenu = menu.subviews!
            self.tabeView.reloadData()
        }
        
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let menu = self.currentMenu[indexPath.row]
        cell.lblTitulo.text = menu.titulo
        return cell
    }
    
}

