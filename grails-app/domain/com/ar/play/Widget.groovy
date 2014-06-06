package com.ar.play

class Widget {
       
   // String position;
    Integer width;
    Integer height;
    String videoId;
    String platform;
    String type;

    static belongsTo = [template:Template]
   
    static constraints = {
        type inList : ["video", "facebook", "twitter", "spotify"]
        platform inList: ["Youtube", "Vimeo"]
        videoId (nullable:true,blank:true,matches:"^[0-9a-z\u00C0-\u00ffA-Z](?: ?[0-9a-z\u00C0-\u00ffA-Z\\.\\-\\/])+")
     
    }
}
