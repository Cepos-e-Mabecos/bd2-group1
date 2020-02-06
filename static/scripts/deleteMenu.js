/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/menu/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        let button = document.createElement("button");
        innerHTML= `  <th scope="row">${element.Menu_Cod}</th>
                <td>${element.Menu_Designation}</td>
                <td>${element.Menu_Type_Cod}</td>
                `;
        button.id=element.Menu_Cod;
        button.classList = "btn btn-danger details";
        button.innerHTML = "Delete Menu";
        /*Set attributes to allow that button to open the modal*/
        button.setAttribute('data-toggle','modal');
        button.setAttribute('data-target','#exampleModal');
        td.appendChild(button);
        tr.innerHTML = innerHTML;
        tr.appendChild(td);
        document.querySelector('tbody').appendChild(tr);  
    });
    /*For each button create an event to trigger the getRestaurant() funtion that will handle the get resquest of that restaurant */
    document.querySelectorAll(".details").forEach(element => {
        element.addEventListener("click", () => {
           deleteMenu(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function deleteMenu(id){
    fetch("http://localhost:5001/menu/" + id, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then((res) => {
        res.json();
        window.location.href = "http://localhost:5000/deleteMenu";
    });
}

