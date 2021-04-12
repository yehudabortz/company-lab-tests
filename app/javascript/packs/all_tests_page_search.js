document.addEventListener("turbolinks:load", function () {
  pageSearch();
});

function pageSearch() {
  let input = document.getElementById("page-search");
  let tableRows = document.getElementsByClassName("divide-y divide-gray-200");
  input.addEventListener("keyup", () => {
    let filter = input.value.toUpperCase();
    for (let i = 0; i < tableRows.length; i++) {
      if (tableRows[i].textContent.toUpperCase().indexOf(filter) > -1) {
        tableRows[i].classList.remove("hidden");
      } else {
        tableRows[i].classList.add("hidden");
      }
    }
  });
}
