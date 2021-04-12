// const tableRows = document.getElementsByClassName("divide-y divide-gray-200");

const input = document.getElementById("page-search");
const tableRows = document.getElementsByClassName("divide-y divide-gray-200");

window.addEventListener("DOMContentLoaded", () => {
  pageSearch();
});

function pageSearch() {
  input.addEventListener("keyup", () => {
    let filter = input.value.toUpperCase();
    for (let i = 0; i < tableRows.length; i++) {
      console.log(tableRows[i]);
      if (tableRows[i].textContent.toUpperCase().indexOf(filter) > -1) {
        tableRows[i].classList.remove("hidden");
      } else {
        tableRows[i].classList.add("hidden");
      }
    }
  });
}
