  function filterItems(){
    var filterText = $("#filterText").val();

    if( filterText != ""){ 
      $('.filterable-list-item').filter(":not(contains(\"" + filterText + "\"))").css("display","none");
      $('.filterable-list-item').filter(":contains(\"" + filterText + "\")").css("display","");
    }
    else{
      $('.filterable-list-item').css("display", "");
    }
    return false;
  }

  $("#filterText").keyup(function(){
    filterItems();
  });

