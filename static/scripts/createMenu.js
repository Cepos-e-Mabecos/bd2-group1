/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/menu_type/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        innerHTML += ` <option value="${element.menu_type_cod}">${element.designation}</option>`;
    });
    document.querySelector('#menuType-input').innerHTML= innerHTML;
});  

document.querySelector('#menuType-input').addEventListener("input",async () => {
    const idMenuType = document.querySelector('#menuType-input').value;
    const response = await fetch('http://localhost:5001/item/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        if(element.Item_Type_Cod == idMenuType){
            innerHTML += `<div class="form-check">
                            <input class="form-check-input" type="radio" value="${element.Item_Cod}">
                            <label class="form-check-label">
                            ${element.Item_Designation}
                            </label>
                        </div>`;
        }
    });
    document.querySelector('.checkbox-container').innerHTML= innerHTML;
});


document.querySelector('#submit-button').addEventListener('click', (event) => {
    event.preventDefault();
    let itemsArray = new Array();
    let itemsInput = document.querySelectorAll('.form-check-input');
    let menuID;
    for (let i = 0; i < itemsInput.length; i++) {
        if(itemsInput[i].checked)
            itemsArray.push(itemsInput[i].value);   
    }
    console.log(itemsArray);

    fetch("http://localhost:5001/menu/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            menu_type_cod: document.querySelector('#menuType-input').value,
            designation: document.querySelector('#name-input').value
        })
    })
    .then((res) => res.json())
    .then((data) => {
        menuID = data.Menu_Cod;
        for (j = 0; j < itemsArray.length; j++) {
            fetch("http://localhost:5001/menu_item/", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    menu_cod: menuID[0],
                    item_cod: itemsArray[j]
                })
            })
            .then((res) => res.json());
        }
    })
    .then(() => {
            fetch("http://localhost:5001/menu_date/", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    menu_cod: menuID[0],
                    designation: document.querySelector('#name-input').value,
                    date_day: document.querySelector('#date-input').value
                })
            })
            .then((res) => res.json());
    })
    .then(() => {
        alert("Menu criado com sucesso!");
        window.location.href = "http://localhost:5000/readMenu";
        
    });
});


