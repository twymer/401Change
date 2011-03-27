

  function filterNeeds(){
    var filterText = $("#filterText").val();

    if( filterText != ""){ 
      $('li.need').filter("li:not(contains(\"" + filterText + "\"))").css("display","none");
      $('li.need').filter("li:contains(\"" + filterText + "\")").css("display","");
    }
    else{
      $('li.need').filter("li").css("display", "");
    }
    return false;
  }

  $("#filterText").keyup(function(){
    filterNeeds();
  });

