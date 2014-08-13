#todo: see: http://www.umade.ru/log/2004/07/css-hover-any-element/
#todo: see: http://peterned.home.xs4all.nl/csshover.html
#todo: see: http://habrahabr.ru/post/138864/
#todo: see: http://habrahabr.ru/post/72417/

#a:hover{text-indent: 0;}

#zoom: 1 !important; /*this triggers haslayout in IE7+6 to fix the extra padding-top problem*/
#-ms-zoom: 1 !important; /*this triggers haslayout in IE8 to fix the hover bug*/
#cursor: pointer !important; /*this fixes IE cursor back to pointer - IE is really the worst browser ever*/

#$(".content").on("mouseover", function(){
#$(this).find("span").show();
#});
#
#$(".content").on("mouseout", function(){
#$(this).find("span").hide();
#});

#function ieHover(tag, cl)
#{
#if (document.all)
#{
#var d = document.getElementsByTagName(tag);
#for (i = 0; i < d.length; i++)
#{
#if (d[i].className == cl)
#  {
#  d[i].onmouseover = function(){this.className = cl + '_ie';}
#d[i].onmouseout = function() {this.className = cl;}
#}
#}
#}
#}