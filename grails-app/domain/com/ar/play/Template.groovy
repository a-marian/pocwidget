/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ar.play

/**
 * @author marianela.alex
 */
class Template {
    
    String name
    Boolean enabled
   
    PreviewTemplate previewTemplate
    
    static hasMany = [widgets:Widget]
	
}

