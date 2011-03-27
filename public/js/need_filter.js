$(function() {
  function filterNeeds(){
    if($("#filterText").val() != ""){ 
      $('li.need').filter("li:not(contains("+$("#filterText").val()+"))").css("display","none");
      $('li.need').filter("li:contains("+$("#filterText").val()+")").css("display","");
    }
    else{
      $('li.need').filter("li").css("display", "");
    }
    return false;
  }

  $("#filterText").keyup(function(){
    filterNeeds();
  });
});
