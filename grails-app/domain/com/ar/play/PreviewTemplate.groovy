package com.ar.play

class PreviewTemplate {

    boolean chosen
    String name
    
    static hasMany = [widget:Widget]
    static belongsTo = [template:Template]
    
 static constraints = {
       name inList : ["templateOne", "templateTwo"]
    }
  
   
}
