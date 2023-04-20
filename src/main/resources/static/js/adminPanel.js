let clickToExpand = Array.from(document.querySelectorAll('#clickToExpand'));
let collapseMenu = Array.from(document.querySelectorAll(".submenulinks"));
var isExpanded = Array(collapseMenu.length).fill(false);
var collapseActionCombine = clickToExpand.map((clickToExpand, index) => {
    return [clickToExpand, collapseMenu[index], isExpanded[index]]
})

collapseActionCombine.forEach(Element => {
    Element[0].addEventListener("click", (e) => {
        Element[1].style = Element[2] ? "" : "overflow: visible";
        Element[1].style = Element[2] ? "" : "height: fit-content";
        Element[2] = !Element[2];
        Element[2] ? Element[0].classList.replace("fa-angle-down", "fa-angle-up") : Element[0].classList.replace("fa-angle-up", "fa-angle-down");

        collapseActionCombine.forEach(element => {
            if (element != Element) {
                element[1].style = "";
                element[1].style = "";
                element[2] = false;
                element[2] ? element[0].classList.replace("fa-angle-down", "fa-angle-up") : element[0].classList.replace("fa-angle-up", "fa-angle-down");
            }
        })
    })
})