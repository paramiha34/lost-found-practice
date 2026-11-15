document.addEventListener("DOMContentLoaded",function(){
  document.querySelectorAll("[data-filter]").forEach(function(el){
    el.addEventListener("click",function(){
      el.parentElement.querySelectorAll("[data-filter]").forEach(function(x){x.classList.remove("on");});
      el.classList.add("on");
      var f=el.dataset.filter;
      document.querySelectorAll(".card[data-type]").forEach(function(c){
        c.style.display=(f==="all"||c.dataset.type===f)?"":"none";
      });
    });
  });
  document.querySelectorAll("[data-pick]").forEach(function(el){
    el.addEventListener("click",function(){
      el.parentElement.querySelectorAll("[data-pick]").forEach(function(x){x.classList.remove("on","l","f");});
      el.classList.add("on",el.dataset.pick);
    });
  });
  var f=document.getElementById("publish-form");
  if(f){f.addEventListener("submit",function(e){e.preventDefault();});}
});
