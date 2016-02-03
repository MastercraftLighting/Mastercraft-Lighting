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
  editInputButtonListener();
  //deleteProductionButtonListener();
  editProductionButtonListener();
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
		var editingRow = $(e.target).parents().eq(2);
    editRow(editingRow, this);
  });
};

var editInputButtonListener = function(){
  $('#channel-hookup').on("submit", ".edit-input-btn", function(e){
    e.preventDefault();
    var form = $(this).serialize();
    console.log("edit input button clicked: " + form);
    debugger;
    updateRow(formData);
  });
};

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

var editRow = function(node, path){
  $.ajax({
    method: "GET",
    url: path,
		context: node
  }).done(function(response){
		insertEditForm(response, this);
	  // $(this).after(response.attachmentPartial);
  }).fail(function(response){
    console.log("ajax edit call failed: " + response);
  });
};

var insertEditForm = function(content, node){
	// fetch the information about row being modified and content to insert
	var details = rowDetails(content, node);
	// expand the height of the row to be edited
	$(node).height(details.newRowHeight);
	$('body').after(content.attachmentPartial);
	//set the position details of the edit form
	$("#equipmentEditForm").css({"display":"block", "left":details.positionLeft, "top":details.positionTop, "position":"absolute","width":details.contentWidth});
	// when submitting the edit form we need to reset all tr height to "auto"
}


var rowDetails = function(content, row){
	var rowHeight =  $(row).height();
	details = {
		newRowHeight: 2* rowHeight,
		contentWidth: $(row).width(),
		positionLeft: $(row).position().left + 1 + "px",
		positionTop: $(row).position().top + rowHeight
	}
	return details
}

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
