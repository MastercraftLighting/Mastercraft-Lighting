$(document).ready(function(){
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
  // editInputButtonListener();
	newEquipmentSubmitListener();
	// editEquipmentSubmitListener();
};

//-------------------------------------------------
// Listeners
//-------------------------------------------------
var deleteButtonListener = function(){
  $('#channel-hookup').on('click', '.delete-button', function(e){
    e.preventDefault();
    var userConfirm = getConfirmation();
    if (userConfirm == true){
      deleteRow(this);
    } else {
    };
  });
};

var editButtonListener = function(){
  $('#channel-hookup').on('click', '.edit-button', function(e){
    e.preventDefault();
    editEquipment(this);
  });
};

// var editInputButtonListener = function(){
//   $('#channel-hookup').on("submit", ".edit-input-btn", function(e){
//     e.preventDefault();
//     var form = $(this).serialize();
//     updateRow(formData);
//   });
// };

var newEquipmentSubmitListener = function(){
	$('.modal').on('click','button.newChannel', function(e){
		e.preventDefault();
		var form = $('form#new_equipment');
		submitNewEquipment(form);
	})
}

//-------------------------------------------------
// Functions
//-------------------------------------------------
var submitNewEquipment = function(form){
	$.ajax({
		method: 'POST',
		url: form.attr('action'),
		data: form.serialize()
	}).done(function(response){
		console.log(response);
	})
}


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

var editEquipment = function(path){
  $.ajax({
    method: "GET",
    url: path
  }).done(function(response){
		// update the edit modal-content with response body
		$('#editEquipmentModal .modal-content').html(response);
		$('#editEquipmentModal').modal('show');
		// insertEditForm(response, this);
  }).fail(function(response){
    console.log("ajax edit call failed: " + response);
  });
};



var getConfirmation = function(){
  return confirm("This will permanently delete this data from your show. Continue?");
};

var updateRow = function(formData){
  // $.ajax({
  //   method: "PATCH",
  //   url:
  // })
};

//-------------------------------------------------
// Printing
//-------------------------------------------------
