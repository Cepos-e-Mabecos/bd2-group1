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
        button.classList = "btn btn-primary details";
        button.innerHTML = "View Details";
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
           getMenu(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function getMenu(id){
    /*fetch function to access the API, in that case a GET request with an ID associate */
    const response = await fetch('http://localhost:5001/menu/' + id );
    let data = await response.json();
    data = data["Record"][0][0];
    console.log(data);
    const response2 = await fetch('http://localhost:5001/menu_item/' );
    let data2 = await response2.json();
    data2 = data2["Records"];
    const response3 = await fetch('http://localhost:5001/menu_date/' + id);
    let data3 = await response3.json();
    data3 = data3["Record"][0][0];
    console.log(data3);
    /*Put information of the restaurant in the modal */
    document.querySelector('#menuName').value = data.Menu_Designation;
    document.querySelector('#menuType').value = data.Menu_Type_Cod;
    document.querySelector('#dateMenu').value = data3.Menu_Date_Date_Day.substring(0,10);
    let innerHTML = ' ';
    data2.forEach((element) => {
        if(element.Menu_Cod == id)
            innerHTML += `<div class="ml-5">&bullet;${element.Item_Designation}</div>`;
    });
    document.querySelector('#localGroup').innerHTML = innerHTML;
}
 
