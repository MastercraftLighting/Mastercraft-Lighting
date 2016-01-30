$(document).ready(function(){
	console.log("document ready")
	toggleMenus();
});

var toggleMenus = function(){
	$(".inventory-toggle").click(function(e){
	e.preventDefault();
    $(".inventory-tab").slideToggle();
    });
    $(".print-toggle").click(function(e){
	e.preventDefault();
    $(".print-tab").slideToggle();
    });
    $(".library-toggle").click(function(e){
	e.preventDefault();
    $(".library-tab").slideToggle();
});
};