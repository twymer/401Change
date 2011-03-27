  function filterNeeds(){
    var filterText = $("#filterText").val();

    if( filterText != ""){ 
      $('.needs-list-item').filter(":not(contains(\"" + filterText + "\"))").css("display","none");
      $('.needs-list-item').filter(":contains(\"" + filterText + "\")").css("display","");
    }
    else{
      $('.needs-list-item').css("display", "");
    }
    return false;
  }

  $("#filterText").keyup(function(){
    filterNeeds();
  });

