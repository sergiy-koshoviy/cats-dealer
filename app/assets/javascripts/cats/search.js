$(document).ready(function(){
  updateLocations();
  updateTable();
});

function updateLocations() {
  $('#cats_breed').change(function(){
    $(this).attr('disabled','disabled');

    let breed = $(this).val();

    $.ajax({
      type: "GET",
      url: "/",
      dataType: 'json',
      data: {
        breed: breed
      },
      success: function(repsonse){
        $('#inputs-container').html(repsonse['inputs']);
        $('#message_container h2').html(repsonse['message'])
        $('#cats-list-container').html('');
        updateLocations();
        updateTable();
      },
      error: function(repsonse){
        $('#inputs-container').html(repsonse['inputs']);
        $('#message_container h2').html(repsonse['message'])
        $('#cats-list-container').html('');
        updateLocations();
        updateTable();
      }
    })

    $(this).attr('disabled',null);
  })
}

function updateTable() {
  $('#location').change(function(){
    $(this).attr('disabled','disabled');

    let cats_breed = $('select#cats_breed').val(),
        location   = $(this).val();

    $.ajax({
      type: "GET", 
      url: "/cats",
      dataType: 'json',
      data: {
        cats: {
          cats_breed: cats_breed,
          location: location
        }
      },
      success: function(repsonse){
        $('#cats-list-container').html(repsonse['html_data']);
        $('#message_container h2').html(repsonse['message'])
        updateTable();
      },
      error: function(repsonse){
        $('#cats-list-container').html(repsonse['html_data']);
        $('#message_container h2').html(repsonse['message'])
        updateTable();
      }
    })

    $(this).attr('disabled',null);
  });
}
