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
        button.classList = "btn btn-danger mx-auto d-block details";
        button.innerHTML = "Delete Restaurant";
        /*Set attributes to allow that button to open the modal*/
        td.appendChild(button);
        tr.innerHTML = innerHTML;
        tr.appendChild(td);
        document.querySelector('tbody').appendChild(tr);  
    });
    /*For each button create an event to trigger the getRestaurant() funtion that will handle the get resquest of that restaurant */
    document.querySelectorAll(".details").forEach(element => {
        element.addEventListener("click", () => {
            deleteRestaurant(element.id);
        });
    });
});   

/*Function the get request of a respective restaurant */
async function deleteRestaurant(id){
    fetch("http://localhost:5001/restaurant/" + id, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then((res) => {
        res.json();
        window.location.href = "http://localhost:5000/deleteRestaurant";
    });
}


