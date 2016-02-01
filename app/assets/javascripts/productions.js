$(document).ready(function(){
	console.log("document ready")
	toggleMenus();
    bindListeners();
});

//------------------------------------------------
// Channel-view slider Functions
//------------------------------------------------
var toggleMenus = function(){
	$(".inventory-toggle").click(function(e){
    	e.preventDefault();
      $(".inventory-tab").slideToggle();
    });

 //    $(".print-toggle").click(function(e){
	//   e.preventDefault();
 //    $(".print-tab").slideToggle();
 //    });

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
    console.log("delete row: " + this);
    var userConfirm = getConfirmation();
    console.log(userConfirm);
    if (userConfirm == true){
      console.log("user confirmed deletion");
      deleteRow(this);
    } else {
      console.log("user cancelled delete action");
    };
  });
};

var editButtonListener = function(){
  $('#channel-hookup').on('click', '.edit-button', function(e){
    e.preventDefault();
    console.log("edit row: " + this);
    editRow(this);
  });
};
//-------------------------------------------------
// Functions
//-------------------------------------------------
var deleteRow = function(path){
  $.ajax({
    method: "DELETE",
    url: path,
    dataType: 'json'
  }).done(function(response){
    console.log("Removing item:" );
    $('#CH-Row' + response.rowNumber).remove();
    $('#CK-Row' + response.rowNumber).remove();
    $('#DM-Row' + response.rowNumber).remove();
    $('#IS-Row' + response.rowNumber).remove();
  }).fail(function(response){
    console.log("ajax delete call failed: " + response);
  });
};

var editRow = function(path){
  $.ajax({
    method: "GET",
    url: path,
    dataType: 'json'
  }).done(function(response){
    console.log("editing item:" );

  }).fail(function(response){
    console.log("ajax edit call failed: " + response);
  });
};

var getConfirmation = function(){
  return confirm("This will permanently delete this data from your show. Continue?");
};

//-------------------------------------------------
// Printing
//-------------------------------------------------

