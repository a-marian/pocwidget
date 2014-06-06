package com.ar.play

class Video {
    
   String videoId;
   Integer width;
   Integer height;

     
    static constraints = {
        videoId (nullable:true,blank:true,matches:"^[0-9a-z\u00C0-\u00ffA-Z](?: ?[0-9a-z\u00C0-\u00ffA-Z\\.\\-\\/])+")
        
    }
}
