function show_hidden_div() {
	//document.getElementById('')
	document.getElementById('hidden_div').style["display"] = "block";
}

function open_dropdown() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}

function closeExtensionFormDiv() {
	document.getElementById('extension').style["display"] = "none";
}


function hiddeForm() {
	document.getElementById('commForm').style["display"] = "none";
}

//Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}