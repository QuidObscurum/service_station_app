var delBtn = document.getElementById("delLink");
var modal = document.getElementById("confirmModal");
var closeSpan = document.getElementsByClassName("close")[0];

var cancelBtn = document.getElementsByClassName("modal-btn-cancel")[0];

delBtn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
closeSpan.onclick = function() {
  modal.style.display = "none";
}

cancelBtn.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
