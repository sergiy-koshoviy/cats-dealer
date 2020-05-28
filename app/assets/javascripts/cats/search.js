$(document).ready(function(){
  $('#search_cats').click(function(){
    $(this).attr('disabled','disabled');
    let cats_breed = $('select#cats_breed').val(),
        location   = $('select#location').val();

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
      },
      error: function(repsonse){
        $('#cats-list-container').html(repsonse['html_data']);
      }
    })

    $(this).attr('disabled',null);
  });
});
