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
  //editInputButtonListener();
  //deleteProductionButtonListener();
  editProductionButtonListener();
	newEquipmentSubmitListener();
	editEquipmentSubmitListener();
};

//-------------------------------------------------
// Listeners
//-------------------------------------------------
var deleteButtonListener = function(){
  $('.container').on('click', '.delete-button', function(e){
    e.preventDefault();
    var userConfirm = getConfirmation();
    if (userConfirm == true){
      deleteRow(this);
    } else {
    };
  });
};

var editButtonListener = function(){
  $('.container').on('click', '.edit-button', function(e){
    e.preventDefault();
    editEquipment(this);
  });
};


var newEquipmentSubmitListener = function(){
	$('.container').on('click','button.newChannel', function(e){
		e.preventDefault();
		var form = $('form#new_equipment');
		submitNewEquipment(form);
	})
}

var editEquipmentSubmitListener = function(){
	$('.container').on('click','button.editChannel', function(e){
		e.preventDefault();
		var form = $('form').not('#new_equipment');
		submitEditEquipment(form);
	})
}


// var deleteProductionButtonListener = function(){
//   $('#production-table').on('click', '.delete-button', function(e){
//     e.preventDefault();
//     alert("You clicked " + this);
//   });
// };

var editProductionButtonListener = function(){
  $('.container').on('click', '.edit-button', function(e){
    e.preventDefault();
    insertEditProductionForm(this);
  });
};
//-------------------------------------------------
// Functions
//-------------------------------------------------
var submitNewEquipment = function(form){
	$.ajax({
		method: 'POST',
		url: form.attr('action'),
		data: form.serialize()
	}).done(function(response){
		$('.container').html(response);
		$('.modal-backdrop').remove();
	})
}

var submitEditEquipment = function(form){
	$.ajax({
		method: 'PATCH',
		url: form.attr('action'),
		data: form.serialize()
	}).done(function(response){
		$('.container').html(response);
		$('.modal-backdrop').remove();
	})
}


var deleteRow = function(path){
	var token = $('meta[name=csrf-token]').attr('content');
  $.ajax({
    method: "DELETE",
    url: path,
		data: {"authenticity_token": ""+token+""}
  }).done(function(response){
    $('.container').html(response);
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

var insertEditProductionForm = function(prod){
  $("#edit-production-" + prod.id).toggle();
  updateProductions(prod);
  };

var updateProductions = function(prod) {
  var prodNumber = prod.id.slice(-1);
  var newUrl = prod.href.replace("/edit", "")
    $("#edit_show" + prodNumber).on('click', function(e){
      e.preventDefault();
    $.ajax({
      url: newUrl,
      type: "PUT",
      data: $(this).closest("form").serialize(),
    }).done(function(response){
      console.log(response)
      $(".container").html(response);

    })
  });
  

}

//-------------------------------------------------
// Printing
//-------------------------------------------------
