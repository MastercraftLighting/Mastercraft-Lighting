$(document).ready(function(){
	console.log("document ready")
	toggleMenus();
    bindListeners();
});

//------------------------------------------------
// Bootstrap Functions
//------------------------------------------------
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

//-------------------------------------------------
// All listeners bound together
//-------------------------------------------------
var bindListeners = function(){
  deleteButtonListener();
  editButtonListener();
};

//-------------------------------------------------
// Listeners
//-------------------------------------------------
var deleteButtonListener = function(){
  $('#channel-hookup').on('click', '.delete-button', function(e){
    e.preventDefault();
    console.log("delete row")
    deleteRow();
  });
};

var editButtonListener = function(){
  $('#channel-hookup').on('click', '.edit-button', function(e){
    e.preventDefault();
    console.log("edit row")
    deleteRow();
  });
};
//-------------------------------------------------
// Functions
//-------------------------------------------------
var deleteRow = function(){

};



