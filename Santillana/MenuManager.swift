//
//  MenuManager.swift
//  Santillana
//
//  Created by Martin Viruete Gonzalez on 12/12/16.
//  Copyright © 2016 Martin Viruete Gonzalez. All rights reserved.
//

import Foundation

class MenuManager {
    
    var titulo = ""
    var storyboardIdentifier: String?
    var subviews: [MenuManager]?
    
    init(titulo: String, storyboardIdentifier: String? = nil, subviews: [MenuManager]? = nil){
        self.titulo = titulo
        self.storyboardIdentifier = storyboardIdentifier
        self.subviews = subviews
    }
    
    class func getMenuSolicitudEducativa() -> [MenuManager]{
        var menu = [MenuManager]()
        
        let introduccion = MenuManager(titulo: "Introducción", storyboardIdentifier: "Introduccion")
        menu.append(introduccion)
        
        let porqueElegir = MenuManager(titulo: "Por que elegir SC")
        var subviewsPorqueElegir = [MenuManager]()
        let ventajasBeneficios = MenuManager(titulo: "Ventajas y Beneficios", storyboardIdentifier: "VentajasBeneficios")
        subviewsPorqueElegir.append(ventajasBeneficios)
        let compartirEnFamilia = MenuManager(titulo: "Compartir En Familia", storyboardIdentifier: "CompartirFamilia")
        subviewsPorqueElegir.append(compartirEnFamilia)
        let lideresCompartir = MenuManager(titulo: "LideresCompartir", storyboardIdentifier: "LideresCompartir")
        subviewsPorqueElegir.append(lideresCompartir)
        porqueElegir.subviews = subviewsPorqueElegir
        menu.append(porqueElegir)
        
        
        let queEs = MenuManager(titulo: "¿Qué es?", storyboardIdentifier: "QueEs")
        menu.append(queEs)
        
        let queIntegra = MenuManager(titulo: "¿Qué Integra?", storyboardIdentifier: "QueIntegra")
        menu.append(queIntegra)
        
        let comoFunciona = MenuManager(titulo: "¿Cómo funciona?")
        var subviewsComoFunciona = [MenuManager]()
        let aulaDigital = MenuManager(titulo: "Aula Digital", storyboardIdentifier: "AulaDigital")
        subviewsComoFunciona.append(aulaDigital)
        let implementacion = MenuManager(titulo: "Implementación", storyboardIdentifier: "Implementacion")
        subviewsComoFunciona.append(implementacion)
        let centroAtencion = MenuManager(titulo: "Centro De Atención y Servicios de Asistencia", storyboardIdentifier: "CentroAtencion")
        subviewsComoFunciona.append(centroAtencion)
        let escuelaCompartir = MenuManager(titulo: "Escuela Compartir", storyboardIdentifier: "EscuelaCompartir")
        subviewsComoFunciona.append(escuelaCompartir)
        comoFunciona.subviews = subviewsComoFunciona
        menu.append(comoFunciona)
        
        let packs = MenuManager(titulo: "Packs", storyboardIdentifier: "Packs")
        menu.append(packs)
        
        return menu
    }
    
    
    
    
    
    
    
}
