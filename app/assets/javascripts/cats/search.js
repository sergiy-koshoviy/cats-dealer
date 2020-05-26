$(document).ready(function(){
  $('#search_cats').click(function(){
    $(this).attr('disabled','disabled');
    let cats_type      = $('select#cats_type').val(),
        user_location  = $('select#user_location').val();

    $.ajax({
      type: "GET", 
      url: "/cats",
      dataType: 'json',
      data: {
        cats_type: cats_type,
        user_location: user_location
      },
      success: function(repsonse){
        $('#cats-list-container').html(repsonse['html_data']);
      },
      error: function(repsonse){
        $('#cats-list-container').html('Oooooppsss...');
      }
    })

    $(this).attr('disabled',null);
  });
});
