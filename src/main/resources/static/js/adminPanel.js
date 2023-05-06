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

/* Add another Admin modal */
function openModal() {
    document.getElementById("myModal").style.display = "block";
}

function ChangePasswordModal() {
    document.getElementById("passwordModal").style.display = "block";
}

function closeModal() {
    document.getElementById("myModal").style.display = "none";
}

function closePasswordModal() {
    document.getElementById("passwordModal").style.display = "none";
}

function togglePassword(icon) {
    var password = document.getElementById("passwordInput");
    if (password.type === "password") {
        password.type = "text";
        document.querySelector("." + icon).classList.remove('fa-eye');
        document.querySelector("." + icon).classList.add('fa-eye-slash');
    } else {
        password.type = "password";
        document.querySelector("." + icon).classList.remove('fa-eye-slash');
        document.querySelector("." + icon).classList.add('fa-eye');
    }
}
/* Add another Admin modal end */

