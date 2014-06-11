<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../css/${previewTemplateInstance?.name}.css" type="text/css">		
        <title>Sample title</title>
    </head>
   <body>
	<div id="header">
		<div class="section">
			<div class="logo">
				<a href="l">zizurz</a>
			</div>
		
		</div>
		<div class="article">
                      <g:each in="${youtubeWidgets}" status="i" var ="yw" >
                                         <g:if test="${yw != null || yw.publishPreview == true}">
                                                <youtube:video height="100%" width="100%" id="${yw.videoId}"/>
                                         </g:if>
                                         <g:else>                                      
                                         </g:else>
                                                 
                      </g:each>
                                            
		
		</div>
	</div>
	<div id="body">
		<ul>
			<li>
				<a href="hairstyle.html"><img src="../../images/hairstyle17.jpg" alt=""></a>
				<b>best hairstylists</b>
				<p>
					Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What’s more, they’re absolutely free!
				</p>
			</li>
			<li>
				<a href="hairstyle.html"><img src="../../images/hairstyle18.jpg" alt=""></a>
				<b>featured hairstyle</b>
				<p>
					Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What’s more, they’re absolutely free!
				</p>
			</li>
			<li>
				<a href="hairstyle.html"><img src="../../images/hairstyle19.jpg" alt=""></a>
				<b>hair care</b>
				<p>
					Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What’s more, they’re absolutely free!
				</p>
			</li>
			<li>
				<a href="hairstyle.html"><img src="../../images/hairstyle20.jpg" alt=""></a>
				<b>we "hair" you</b>
				<p>
					Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What’s more, they’re absolutely free!
				</p>
			</li>
		</ul>
		<div>
			<div class="featured">
				<h2>featured</h2>
				<img src="../../images/hairfeatured.jpg" alt="">
				<h3>Hair, I just meet you</h3>
				<p>
					Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What’s more, they’re absolutely free! You can do a lot with them. You can modify them. You can use them to design websites for clients, so long as you agree with the Terms of Use.
				</p>
				<p>
					You can even remove all our links if you want to. Looking for more templates? Just browse through all our Free Website Templates and find what you’re looking for. But if you don’t find any website template you can use, you can try our Free Web Design service and tell us all about it. Maybe you’re looking for something different, something special.
				</p>
				<p>
					And we love the challenge of doing something different and something special. If you’re experiencing issues and concerns about this website template, join the discussion on our forum and meet other people in the community who share the same interests with you. Version 13.
				</p>
			</div>
			<div class="section">
				<div class="article">
					<h2>hairstyle</h2>
					<p>
						This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
					</p>
					<a href="#">Mike M.</a>
				</div>
				<div class="newsletter">
					<img src="../../images/skinhead.png" alt="">
					<p>
						Are you losing your hair? Let us help you in bringing back your confidence. <span>Call Us at 1800-0000-0000</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div>
			<div class="connect">
				<a href="http://freewebsitetemplates.com/go/twitter/" id="twitter">twitter</a>
				<a href="http://freewebsitetemplates.com/go/facebook/" id="facebook">facebook</a>
				<a href="http://freewebsitetemplates.com/go/googleplus/" id="googleplus">googleplus</a>
				<a href="http://pinterest.com/fwtemplates/" id="pinterest">pinterest</a>
			</div>
			<p>
				&copy; copyright 2023 | all rights reserved.
			</p>
		</div>
	</div>
</body>
</html>