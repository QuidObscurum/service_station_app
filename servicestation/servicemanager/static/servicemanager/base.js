var delBtn = document.getElementById("delCustomerLink");
var modal = document.getElementById("confirmModal");
var closeSpan = document.getElementsByClassName("close")[0];

var cancel = document.getElementsByClassName("modal-btn-cancel")[0];

delBtn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
closeSpan.onclick = function() {
  modal.style.display = "none";
}

cancel.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
