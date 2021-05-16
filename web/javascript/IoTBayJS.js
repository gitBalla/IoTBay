function searchLogTable() {
    var input, filter, table, tr, td, txtValue;
    input = document.getElementById("logSearchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("userLogTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.innerHTML || td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    } //innerHTML.toUpperCase().indexOf(filter) > -1)
}

function resetSearchTable() {
    document.getElementById("logSearchInput").value = "";
}