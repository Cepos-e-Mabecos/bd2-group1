/*Function that handle the get request all of the restaurants */
window.addEventListener("load", async () => {
    /*fetch function to access the API */
    const response = await fetch('http://localhost:5001/restaurant/');
    /*Transform the response to JSON */
    let data = await response.json();
    data = data["Records"];
    let innerHTML = ' ';
    data.forEach((element) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        let button = document.createElement("button");
        innerHTML= `  <th scope="row">${element.Restaurant_Cod}</th>
                <td>${element.Restaurant_Designation}</td>
                <td>${element.Restaurant_Local}</td>
                `;
        button.id=element.Restaurant_Cod;
        button.classList = "btn btn-primary mx-auto d-block details";
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
           getRestaurant(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function getRestaurant(id){
    /*fetch function to access the API, in that case a GET request with an ID associate */
    const response = await fetch('http://localhost:5001/restaurant/'+id);
    let data = await response.json();
    data = data["Record"][0][0];
    /*fetch function to access the API, in that case a GET request of the zones */
    const response2 = await fetch('http://localhost:5001/zone/');
    let data2 = await response2.json();
    data2 = data2["Records"];
    /*Creation of an array */
    let locals = new Array();
    data2.forEach((element)=>{
        /*Save in an array the zones of the restaurant with the id receveid */
        if(element.Restaurant_Cod == id){
            locals.push(element.Zone_Designation);
        }
    });
    /*Put information of the restaurant in the modal */
    document.querySelector('#nameRestaurant').value = data.Restaurant_Designation;
    document.querySelector('#localRestaurant').value = data.Restaurant_Local;
    let innerHTML = ' ';
    for(let i = 0; i<locals.length;i++){
        innerHTML += `<div class="ml-5">&bullet;${locals[i]}</div>`;
    }
    document.querySelector('#localGroup').innerHTML = innerHTML;
}
 
