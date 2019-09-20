var triggers = document.getElementsByClassName("trigger");
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
for (var i = 0; i < triggers.length; i++) {
    var t = triggers[i];
    t.onclick = function() {
        var obj_pk = t.id;
        var close = document.getElementById("close"+obj_pk);
        var cancel = document.getElementById("cancel"+obj_pk);
        var modal_id = "confirmModal" + obj_pk;
        modal = document.getElementById(modal_id);
        modal.style.display = "block";

        close.onclick = function() {
            modal.style.display = "none";
        }

        cancel.onclick = function() {
            modal.style.display = "none";
        }
    }
}