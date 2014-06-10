package com.ar.play

class PreviewTemplate {

    boolean chosen
    String name
    
    static hasMany = [widget:Widget]
      
 static constraints = {
       name inList : ["templateOne", "templateTwo"]
       
  }
  
   
}
